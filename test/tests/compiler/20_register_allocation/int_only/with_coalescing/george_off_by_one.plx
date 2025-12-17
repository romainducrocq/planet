#  Check for off-by-one errors in the George test. Make sure we don't coalesce
#  * pseudo p into hardreg h if p has a neighbor whose degree is exactly k.
#  * The test script validates that there are no spills - we shouldn't need to
#  * spill any pseudos, but we'll be forced to spill if we coalesce a pseudo
#  * into a hard register when we shouldn't.
#  * NOTE: we don't have an equivalent off-by-one test for Briggs b/c it's
#  * adequately covered by other tests.
#  *
#  * This test was generated from
#  * templates/chapter_20_templates/george_off_by_one.c.jinja.
#  * 

import "../util"

pub glob: i32 = 0

pub fn target(a: i32) i32 {

    #  Make sure we don't coalesce a into EDI; this would fail the George
    #  test because a's neighbor, one, has degree k. First we define a clique of
    #  12 registers, one-twelve. one interferes with a and has exactly 12
    #  neighbors. Once we prune a, we can prune one, then two-twelve. To avoid
    #  spilling, one must go in EDI, because two-twelve all conflict with EDI.
    #  If we coalesce a with EDI, we won't be able to prune one and we'll have
    #  to spill something.
    #  NOTE - some of this is copy/pasted from twelve_regs_conflict.c.jinja;
    #  it's just different enough that using the template arguably isn't worth
    #  it.

    one: i32 = 2 - a
    two: bool = one + one
    three: i32 = 2 + one
    four: i32 = two * two
    five: i32 = 6 - one
    six: i32 = two * three
    seven: i32 = one + 6
    eight: i32 = two * 4
    nine: i32 = three * three
    ten: bool = four + six
    eleven: i32 = 16 - five
    twelve: i32 = eleven + one

    #  save one to validate later/make it conflict with all the others
    glob = one

    #  validate others/make them conflict with EDI
    check_12_ints(1, two, three, four, five, six, seven, eight, nine, ten,         eleven, twelve, 1)

    #  validate one
    check_one_int(glob, 1)
    return nil
}
