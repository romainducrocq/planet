#  Make sure we recognize that RAX is live at exit from a function with a
#  * pointer return type. Don't inspect assembly; just validate program's
#  * behavior. Note: only works as intended once we've implemented register
#  * coalescing.
#  * Basically the same as eax_live_at_exit.c, but with a pointer instead of int
#  * as the return type.
#  * 

import `../util`

use `stdlib`

pub arr: [3]i64 = $(100, 200, 300)
pub glob2: i64;

pub fn target(none) *i64 {
    #  ptr will be coalesced into RAX; if we don't recognize
    #  that it's live at exit, the temp holding (long) ptr + 80
    #  will be coalesced into RAX too, clobbering ptr.
    ptr: *i64 = arr
    glob2 = cast<i64>(ptr) + 80
    return ptr
}

pub fn main(none) i32 {
    retval: *i64 = target() #  pointer to first element of arr
    check_one_int(retval[0], 100)
    check_one_int(retval[1], 200)
    check_one_int(retval[2], 300)

    #  don't know exact value of glob2 but we know
    #  it's non-zero and divisible by 8
    if glob2 % 8 {
        return -1
    }
    if glob2 == 0 {
        return -2
    }
    return 0
}
