#  Test that we performing coalescing between quadword pseudos that pass the
#  * Briggs test. In this case, coalescing lets us get rid of all moves between
#  * registers. We inspect the assembly for the target function to validate that
#  * it contains no spills and no mov instructions whose source and destination
#  * are both general-purpose registers (except mov %rsp, %rbp and mov %rbp, %rsp
#  * in the prologue and epilogue).
#  *
#  * This test was generated from templates/chapter_20_templates/briggs_coalesce.c.jinja.
#  * 

import "../util"

pub glob: i64 = 5l

pub glob7: i64;
pub glob8: i64;
pub glob9: i64;
pub glob10: i64;
pub glob11: i64;
pub glob12: i64;

pub fn target(one: i64, two: i64, three: i64, four: i64, five: i64, six: i64) i32 {

    #  Define 6 variables that interfere with each other and with arguments,
    #  initializing each one with a complex expression that requires an
    #  intermediate result. The pseudoregister holding each result should be
    #  coalesced into the corresponding variable. Once these have been coalesced
    #  only 12 pseudos will be left, and we'll have reduced the number of nodes
    #  with significant degree by enough that we can coalesce all the arguments
    #  into parameter-passing registers. This test coalesces temporary values
    #  into 6 different variables, which must all be placed in different
    #  registers, to validate that we actually performed coalescing and didn't
    #  just happen to assign a variable and the corresponding intermediate
    #  result to the same hard register.
    seven: i64 = (glob - 2l) + four
    eight: i64 = (glob - 1l) * two
    nine: i64 = (glob - 2l) * three
    ten: i64 = (10l - glob) * two
    eleven: i64 = (glob * two) + one
    twelve: i64 = (glob + 1l) * two

    #  Save to global variables to validate later
    glob7 = seven
    glob8 = eight
    glob9 = nine
    glob10 = ten
    glob11 = eleven
    glob12 = twelve

    #  Validate arguments
    check_12_longs(one, two, three, four, five, six, 7l, 8l, 9l, 10l, 11l, 12l,         1l)

    #  Validate globals
    check_one_long(glob7, 7l)
    check_one_long(glob8, 8l)
    check_one_long(glob9, 9l)
    check_one_long(glob10, 10l)
    check_one_long(glob11, 11l)
    check_one_long(glob12, 12l)
    return false
}
