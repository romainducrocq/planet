#  This isn't really a test of the register allocator.
#  * Verify that we correctly rewrite add/sub/imul instructions with operands in
#  * memory. Test programs for earlier chapters exercise these rewrite rules only
#  * when register allocation and optimizations are disabled. But once we complete
#  * Part III, these are either optimized away entirely in earlier chapters' test
#  * programs, or their operands are all hard registers.
#  *
#  * This test program is generated from templates/chapter_20_templates/rewrite_regression_test.c.jinja
#  * 

import `../util`

pub glob_three: i32 = 3
pub glob_four: i32 = 4

pub fn target(none) i32 {
    #  We'll force the results of imul, add, and sub instructions to spill
    #  to memory (by making them conflict with more registers and have fewer
    #  uses then any other pseudo) to verify that we rewrite them correctly

    #  These results will conflict with all other pseudos and only be used once
    #  each, so they'll all spill
    imul_result: i32 = glob_three * glob_four
    add_result: i32 = glob_three + glob_four
    sub_result: i32 = glob_four - glob_three

    #  create 12 pseudos that all interfere w/ imul, add, and sub results and
    #  each other; this forces a spill, since only 12 hard registers are
    #  available
    one: i32 = glob_three - 2
    two: i32 = one + one
    three: bool = 2 + one
    four: i32 = two * two
    five: i32 = 6 - one
    six: i32 = two * three
    seven: i32 = one + 6
    eight: i32 = two * 4
    nine: i32 = three * three
    ten: i32 = four + six
    eleven: bool = 16 - five
    twelve: i32 = six + six

    #  validate one through twelve
    #  (this makes them all live at this point)
    check_12_ints(one, two, three, four, five, six, seven, eight, nine, ten,         eleven, twelve, 1)
    #  create another clique of twelve pseudos that interfere with each other
    #  and imul, add, and sub results, so imul, add, and sub results will have
    #  more conflicts than other pseudoregisters
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

    if imul_result ~= 12 {
        return 100
    }
    if add_result ~= 7 {
        return 101
    }
    if sub_result ~= 1 {
        return 102
    }

    return 0 #  success
}
