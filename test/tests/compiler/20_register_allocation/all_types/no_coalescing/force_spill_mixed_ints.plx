#  Test that we can handle spilling correctly.
#  * We have to spill one pseudo. The test script will validate that
#  * we spill only one and it's the cheapest one.
#  * Note that this isn't a foolproof test of spill cost calculation;
#  * because of optimistic coloring, we might end up spilling should_spill
#  * even if it's not the first spill candidate we select.
#  * This test program is generated from templates/chapter_20_templates/force_spill.c.jinja
#  * 

import "../util"

pub glob_three: u32 = 3
pub glob_11: i64 = 11l
pub glob_12: f64 = 12.0
pub glob_23: i64 = 23l
pub glob_24: f64 = 24.0

pub fn target(none) i32 {
    #  This is our spill candidate: it has the highest degree and is
    #  used only once.
    should_spill: i64 = glob_three + 3

    #  create 12 pseudos that all interfere w/ should_spill and each other;
    #  this forces a spill, since only 12 hard registers are available
    one: u32 = glob_three - 2
    two: i64 = one + one
    three: u64 = 2 + one
    four: char = two * two
    five: i8 = 6 - one
    six: i32 = two * three
    seven: u8 = one + 6
    eight: i64 = two * 4
    nine: u64 = three * three
    ten: char = four + six
    eleven: *i64 = @glob_11
    twelve: *f64 = @glob_12

    #  validate one through twelve
    #  (this makes them all live at this point)
    check_12_vals(one, two, three, four, five, six, seven, eight, nine, ten,         eleven, twelve, 1)
    #  create another clique of twelve pseudos that interfere with each other
    #  and should_spill, so should_spill will have more conflicts than other
    #  pseudoregisters
    thirteen: u32 = 10 + glob_three
    fourteen: i64 = thirteen + 1
    fifteen: u64 = 28 - thirteen
    sixteen: char = fourteen + 2
    seventeen: i8 = 4 + thirteen
    eighteen: i32 = 32 - fourteen
    nineteen: u8 = 35 - sixteen
    twenty: u32 = fifteen + 5
    twenty_one: i64 = thirteen * 2 - 5
    twenty_two: u64 = fifteen + 7
    twenty_three: *i64 = @glob_23
    twenty_four: *f64 = @glob_24

    #  validate thirteen through twenty-four
    #  (this makes them all live at this point)
    check_12_vals(thirteen, fourteen, fifteen, sixteen, seventeen, eighteen,         nineteen, twenty, twenty_one, twenty_two, twenty_three,         twenty_four, 13)

    if should_spill ~= 6 {
        return -1 #  fail
    }

    return 0 #  success
}
