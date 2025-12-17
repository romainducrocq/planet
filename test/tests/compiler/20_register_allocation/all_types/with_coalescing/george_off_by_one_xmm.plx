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

pub glob: f64 = 0.0

pub fn target(a: f64) i32 {

    #  Make sure we don't coalesce a into XMM0; this would fail the George
    #  test because a's neighbor, one, has degree k. First we define a clique of
    #  14 registers, one-fourteen. one interferes with a and has exactly 14
    #  neighbors. Once we prune a, we can prune one, then two-fourteen. To avoid
    #  spilling, one must go in XMM0, because two-fourteen all conflict with
    #  XMM0. If we coalesce a with XMM0, we won't be able to prune one and we'll
    #  have to spill something.
    #  NOTE - some of this is copy/pasted from twelve_regs_conflict.c.jinja;
    #  it's just different enough that using the template arguably isn't worth
    #  it.

    one: f64 = 2.0 - a
    two: f64 = one + one
    three: f64 = 2.0 + one
    four: f64 = two * two
    five: f64 = 6.0 - one
    six: f64 = two * three
    seven: f64 = one + 6.0
    eight: f64 = two * 4.0
    nine: f64 = three * three
    ten: f64 = four + six
    eleven: f64 = 16.0 - five
    twelve: f64 = eleven + one
    thirteen: f64 = five + eight
    fourteen: f64 = seven * two

    #  save one to validate later/make it conflict with all the others
    glob = one

    #  validate others/make them conflict with XMM0
    check_14_doubles(1, two, three, four, five, six, seven, eight, nine, ten,         eleven, twelve, thirteen, fourteen, 1)

    #  validate one
    check_one_double(glob, 1.0)
    return nil
}
