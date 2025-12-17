#  Make sure we use all hardregs rather than spill;
#  * Create 12 pseudos that all interfere with each other
#  * and make sure we assign all of them to hardregs
#  * This test program is generated from templates/chapter_20_templates/use_all_hardregs.c.jinja
#  * 
import "../util"

pub global_one: i32 = 1 #  to prevent constant-folding

pub fn target(none) i32 {
    #  create a clique of 12 pseudos that interfere
    #  we can color all of them w/out spilling anything

    one: i32 = 2 - global_one
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
    return 0 #  success
}
