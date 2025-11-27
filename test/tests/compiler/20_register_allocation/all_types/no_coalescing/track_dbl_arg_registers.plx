#  Make sure our analysis recognizes which registers are used by each function
#  * call - same idea as chapter_20/int_only/no_coalescing/track_arg_registers.c.
#  * The test script validates that we don't spill.
#  * Liveness analysis should recognize that only XMM0-XMM2 are live right before
#  * we call callee(). If we assume XMM3-XMM7 are also live, we'll conclude
#  * they're live from the start of the function until the function call
#  * (since they're never updated) and won't be able to allocate them, resulting
#  * in spills.
#  * 

import `../util`

#  defined in tests/chapter_20/helper_libs/track_dbl_arg_registers_lib.c,
#  exits early if a, b, c don't have expected values
pub fn callee(a: f64, b: f64, c: f64) i32;

pub glob1: f64;
pub glob2: f64;
pub glob3: f64;
pub glob4: f64;
pub glob5: f64;
pub glob6: f64;
pub glob7: f64;
pub glob8: f64;
pub glob9: f64;
pub glob10: f64;
pub glob11: f64;

#  Note: we deliberately give target the same number of params as callee;
#  if liveness incorrectly thought that some reg was used by callee and
#  therefore live, it still wouldn't interfere with the parameter passed to
#  target in that reg, so the error wouldn't necessarily force a spill. (I think
#  having _fewer_ params in target than in callee would be be fine.)
pub fn target(one: f64, two: f64, three: f64) bool {
    four: f64 = three + one
    five: f64 = two + three
    six: f64 = three * two
    seven: f64 = 13. - six
    eight: f64 = four * two
    nine: f64 = three * three
    ten: f64 = five * two
    eleven: f64 = seven * two - three
    twelve: f64 = eight * four - 20.
    thirteen: f64 = (nine + ten) - six
    fourteen: f64 = eleven + 3

    #  copy variables into global variables to make them interfere
    glob1 = one
    glob2 = two
    glob3 = three
    glob4 = four
    glob5 = five
    glob6 = six
    glob7 = seven
    glob8 = eight
    glob9 = nine
    glob10 = ten
    glob11 = eleven

    #  don't need to copy in twelve through fourteen b/c we use them below

    #  use ten through twelve
    callee(twelve, thirteen, fourteen)

    #  validate globals
    check_14_doubles(glob1, glob2, glob3, glob4, glob5, glob6, glob7, glob8,         glob9, glob10, glob11, 12., 13., 14., 1)

    return 0
}

