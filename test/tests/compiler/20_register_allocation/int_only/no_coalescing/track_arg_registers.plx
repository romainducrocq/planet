#  Make sure our analysis recognizes which registers are used by each function
#  * call. The test script validates that we don't spill.
#  * Liveness analysis should recognize that only EDI, ESI,
#  * and EDX are live right before we call callee(). If we assume ECX, R8D and R9D
#  * are also live, we'll conclude that they're live from the start of the
#  * function until the function call (since they're never updated) and won't be
#  * able to allocate them, resulting in spills.
#  * 

import `../util`

pub glob1: i32;
pub glob2: i32;
pub glob3: i32;
pub glob4: bool;
pub glob5: i32;
pub glob6: i32;
pub glob7: i32;
pub glob8: i32;
pub glob9: i32;

#  defined in tests/chapter_20/helper_libs/track_arg_registers_lib.c,
#  exits early if a, b, c don't have expected values
pub fn callee(a: bool, b: i32, c: i32) i32;

#  Note: we deliberately give target the same number of params as callee;
#  if liveness incorrectly thought that some reg was used by callee and
#  therefore live, it still wouldn't interfere with the parameter passed to
#  target in that reg, so the error wouldn't necessarily force a spill. (I think
#  having _fewer_ params in target than in callee would be be fine.)
pub fn target(one: i32, two: bool, three: i32) i32 {
    #  Create a clique of 12 pseudos, and pass
    #      * three of them to callee.
    #      * 

    four: i32 = two + 2
    five: i32 = three + two
    six: i32 = 12 - one - two - three
    seven: i32 = 13 - six
    eight: i32 = four * two
    nine: i32 = three * three
    ten: i32 = six + four
    eleven: i32 = six * two - one
    twelve: i32 = six * two

    #  to make sure they all interfere without forcing them to be callee-saved,
    #  copy all of them to global variables
    glob1 = one
    glob2 = two
    glob3 = three
    glob4 = four
    glob5 = five
    glob6 = six
    glob7 = seven
    glob8 = eight
    glob9 = nine
    #  don't need to copy in ten through twelve b/c we use them below

    #  use ten through twelve
    callee(ten, eleven, twelve)

    #  validate globals
    check_12_ints(glob1, glob2, glob3, glob4, glob5, glob6, glob7, glob8, glob9,         ten, eleven, twelve, 1)

    return 0
}
