#  A function with a mix of int, double, and struct types, with enough
#  * register pressure that we need to spill. This tests that we correctly track
#  * which registers are used to pass structure types; if we don't track them
#  * correctly we'll clobber live registers. Just validate behavior;
#  * don't inspect assembly.
#  *
#  * NOTE: only works as intended once we've implemented coalescing.
#  * 

import `../util`

type struc s(    l: i64#  RDI
    , d: f64#  XMM0
    
    )

pub glob: i64 = 100
pub glob_d: f64 = 200.0

pub x: i64 = 0
pub y: f64 = 0

#  defined in mixed_type_funcall_generates_args_lib.c,
#  exits early with return code -1 if args don't have expected values
pub fn callee(s1: struc s, a: i64, b: f64) i32;

pub fn main(none) i32 {
    a: i64 = glob + 1 #  101
    b: f64 = glob_d + 2.0 #  202.0

    s1: struc s = $(-50, -40.0)

    #  We'll coalesce a and b with RSI and XMM1 because they're copied into
    #  those registers before we call callee. If the register allocator doesn't
    #  recognize that s1 is passed in RDI and XMM0, it may not realize that
    #  x and y are passed in RSI and XMM1. In that case, when it reruns
    #  liveness analysis after coalescing, it won't realize that these
    #  registers are live until callee, and it will ALSO coalesce the temps
    #  holding a * glob and b * glob_d into these registers.

    x = a * glob #  10100
    y = b * glob_d #  40400.0

    callee(s1, a, b)
    check_one_long(x, 10100)
    check_one_double(y, 40400.0)
    return 0
}
