#  Test that we recognize EAX is not live at exit when we return
#  * a struct in XMM registers. If we think EAX is live we won't be able
#  * to allocate pseudoregisters to it, which will lead to spills.
#  * The test script validates that the assembly program
#  * doesn't use any memory access instructions except to populate and
#  * transfer the return value struct. There should be at most eight
#  * memory access instructions: for each of this function's two return
#  * statements (success and failure), two instructions populate the return
#  * value struct and two move it into the XMM0/XMM1 registers.
#  * The target function, defined in tests/chapter_20/helper_libs/return_double_struct_lib.c,
#  * calls return_double and validates the result.
#  *
#  * This test program is generated from templates/chapter_20_templates/twelve_pseudos_interfere.c.jinja.
#  
type struc s(    d1: f64    , d2: f64    
    )
pub global_one: i32 = 1 #  to prevent constant-folding

pub fn return_struct(none) struc s {
    #  create a clique of 12 pseudos that interfere
    #  we can color all of them w/out spilling anything

    one: i32 = 2 - global_one
    two: i32 = one + one
    three: i32 = 2 + one
    four: i32 = two * two
    five: i32 = 6 - one
    six: i32 = two * three
    seven: i32 = one + 6
    eight: i32 = two * 4
    nine: i32 = three * three
    ten: i32 = four + six
    eleven: i32 = 16 - five
    twelve: i32 = six + six

    #  validate them
    if one == 1 and two == 2 and three == 3 and four == 4 and five == 5 and     six == 6 and seven == 7 and eight == 8 and nine == 9 and ten == 10 and     eleven == 11 and twelve == 12 {
        retval: struc s = $(0.0, 200.0)
        return retval #  success
    }
    else {
        retval: struc s = $(1.0, -1.0)
        return retval #  fail
    }
}
