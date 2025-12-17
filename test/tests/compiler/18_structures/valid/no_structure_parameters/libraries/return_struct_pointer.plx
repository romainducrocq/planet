#  Test returning struct pointers from functions
#  * and using struct pointers returned from functions
#  * 

import "return_struct_pointer"

#  define some functions that return pointers to structs
pub fn make_struct_inner(seed: bool) *struc inner {
    ptr: *struc inner = malloc(sizeof<struc inner>)
    ptr[].d = seed
    ptr[].i = seed
    return ptr
}

pub fn make_struct_outer(seed: i32) *struc outer {
    ptr: *struc outer = malloc(sizeof<struc outer>)
    ptr[].a = seed
    ptr[].b = seed + 1
    ptr[].substruct.d = seed + 2
    ptr[].substruct.i = seed + 3
    return ptr
}

pub fn make_struct_outermost(seed: i32) *struc outermost {
    ptr: *struc outermost = malloc(sizeof<struc outermost>)
    ptr[].i = seed
    ptr[].nested_ptr = make_struct_outer(seed + 1)
    ptr[].nested_struct.a = seed + 5
    ptr[].nested_struct.b = seed + 6
    ptr[].nested_struct.substruct.d = seed + 7
    ptr[].nested_struct.substruct.i = seed + 8
    return ptr
}
