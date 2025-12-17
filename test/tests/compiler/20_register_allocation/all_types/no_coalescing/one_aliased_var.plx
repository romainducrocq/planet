#  Make sure that one aliased pseudoregister doesn't prevent us from allocating
#  * pseudos for other, non-aliased pseudoregisters.
#  * We have to put arguments one and one_d on the stack because they're aliased,
#  * but should be able to store all other pseudos in registers.
#  

import "../util"

pub fn increment(ptr: *i32) none {
    ptr[] = ptr[] + 1
    return none
}

pub fn deref(ptr: *f64) f64 {
    return ptr[]
}

#  This should contain at most three memory access instructions (not counting
#  push/pop/lea): moving one from EDI to the stack, moving one_d from XMM0 to
#  the stack, and moving one back into the EDI register before calling
#  check_one_int
pub fn target(one: i32, two: i32, three: i32, one_d: f64) i32 {
    ptr: *i32 = @one
    d_ptr: *f64 = @one_d
    check_one_double(deref(d_ptr), 1.0)
    increment(ptr) #  increment one
    five: i64 = two + three
    check_one_int(one, 2)
    check_one_long(five, 5l)
    return 0
}
