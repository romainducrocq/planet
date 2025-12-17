#  Make sure variables that must be preserved across function calls are placed
#  * in callee-saved registers. This test is only guaranteed to work as intended
#  * once we implement register coalescing;  before then, it's possible (though
#  * unlikely) that we'll put each pseudo in an appropriate hard register by
#  * accident.
#  

import "../util"

pub glob1: i32 = 1
pub glob2: i32 = 2
pub glob3: bool = 3
pub glob4: i32 = 4
pub glob5: i32 = 5

pub fn callee(a: i32, b: i32, c: i32, d: i32, e: i32) i32 {
    glob1 = -a
    glob2 = -b
    glob3 = -c
    glob4 = -d
    glob5 = -e
    #  call a function that takes 6 arguments to make sure
    #  we clobber every caller-saved register
    check_5_ints(1, 2, 3, 4, 5, 1)
    return 0
}

pub fn target(none) i32 {
    #  Define some variables that must persist across function call.
    a: i32 = 99 * glob1 #  99
    b: i32 = 200 / glob2 #  100
    c: i32 = ? glob3 then 104 - glob3 else 0 #  101
    d: i32 = c + (glob4 or glob1) #  102
    e: i32 = 108 - glob5 #  103

    #  Note that even once we have register coalescing, we won't coalesce
    #  any of these arguments into parameter passing registers,
    #  because they interfere with them.
    callee(a, b, c, d, e)

    #  validate global variables, which were updated by callee
    check_one_int(glob1, -99)
    check_one_int(glob2, -100)
    check_one_int(glob3, -101)
    check_one_int(glob4, -102)
    check_one_int(glob5, -103)

    #  define 5 other variables that conflict with a-e but don't need to be
    #  preserved across function calls, in order to increase
    #  register pressure and decrease the likelihood that we put a-e
    #  in the correct registers by accident, even before coalescing
    f: i32 = a - 100
    g: i32 = b - 100
    h: bool = c - 100
    i: i32 = d - 100
    j: i32 = e - 100

    #  same f-h to global variables to validate later (don't use check_5_ints
    #  b/c that would make param-passing registers interfere with a-e,
    #  preventing us from coalescing them, even if we didn't recognize
    #  that all function calls clobber those registers)
    glob1 = f
    glob2 = g
    glob3 = h
    glob4 = i
    glob5 = j

    #  validate a-e to make sure they haven't been clobbered by
    #  any intervening function calls
    check_one_int(a, 99)
    check_one_int(b, 100)
    check_one_int(c, 101)
    check_one_int(d, 102)
    check_one_int(e, 103)

    #  validate globals w/ values of f-h
    check_5_ints(glob1, glob2, glob3, glob4, glob5, -1)

    return 0 #  success
}
