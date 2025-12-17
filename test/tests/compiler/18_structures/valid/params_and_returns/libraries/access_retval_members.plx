#  Test for accessing the members in a return value of structure type 
import "access_retval_members"

pub fn return_small_struct(none) struc inner {
    i: struc inner = $(101, 102)
    return i
}

pub fn return_nested_struct(none) struc outer {
    data ret: struc outer = $(
        2.0, 0, $(10, 11))

    #  on first call to this function, initializer ret.ptr
    if not ret.ptr {
        ret.ptr = calloc(1, sizeof<struc inner>)
        ret.ptr[].x = 12
        ret.ptr[].y = 13
    }

    return ret
}

