#  Test that we can handle spilling correctly.
#  * We have to spill one pseudo. The test script will validate that
#  * we spill only one and it's the cheapest one.
#  * Note that this isn't a foolproof test of spill cost calculation;
#  * because of optimistic coloring, we might end up spilling should_spill
#  * even if it's not the first spill candidate we select.
#  * This test program is generated from templates/chapter_20_templates/force_spill.c.jinja
#  * 

import "../util"

pub glob_three: i32 = 3

pub fn target(none) bool {
    #  This is our spill candidate: it has the highest degree and is
    #  used only once.
    should_spill: i32 = glob_three + 3

    #  create 12 pseudos that all interfere w/ should_spill and each other;
    #  this forces a spill, since only 12 hard registers are available
    one: i32 = glob_three - 2
    two: i32 = one + one
    three: i32 = 2 + one
    four: i32 = two * two
    five: i32 = 6 - one
    six: bool = two * three
    seven: i32 = one + 6
    eight: i32 = two * 4
    nine: i32 = three * three
    ten: i32 = four + six
    eleven: i32 = 16 - five
    twelve: i32 = six + six

    #  validate one through twelve
    #  (this makes them all live at this point)
    check_12_ints(one, two, three, four, five, six, seven, eight, nine, ten,         eleven, twelve, 1)
    #  create another clique of twelve pseudos that interfere with each other
    #  and should_spill, so should_spill will have more conflicts than other
    #  pseudoregisters
    thirteen: i32 = 10 + glob_three
    fourteen: i32 = thirteen + 1
    fifteen: i32 = 28 - thirteen
    sixteen: i32 = fourteen + 2
    seventeen: i32 = 4 + thirteen
    eighteen: i32 = 32 - fourteen
    nineteen: i32 = 35 - sixteen
    twenty: i32 = fifteen + 5
    twenty_one: i32 = thirteen * 2 - 5
    twenty_two: i32 = fifteen + 7
    twenty_three: i32 = 6 + seventeen
    twenty_four: i32 = thirteen + 11

    #  validate thirteen through twenty-four
    #  (this makes them all live at this point)
    check_12_ints(thirteen, fourteen, fifteen, sixteen, seventeen, eighteen,         nineteen, twenty, twenty_one, twenty_two, twenty_three,         twenty_four, 13)

    if should_spill ~= 6 {
        return -1 #  fail
    }

    return 0 #  success
}
