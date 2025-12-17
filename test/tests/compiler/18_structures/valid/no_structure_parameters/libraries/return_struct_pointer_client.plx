#  Test returning struct pointers from functions
#  * and using struct pointers returned from functions
#  * 

import "return_struct_pointer"

#  case 1: use a struct pointer returned from a function call
pub fn test_get_struct_ptr(none) bool {
    inner_ptr: *struc inner = make_struct_inner(11)

    if inner_ptr[].d ~= 11 or inner_ptr[].i ~= 11 {
        return 0
    }

    #  assign struct pointer to member
    o: struc outermost = $(nil, 0, $(0, 0, $(0, 0)))
    o.nested_ptr = make_struct_outer(20)
    if o.nested_ptr[].a ~= 20 or o.nested_ptr[].b ~= 21 or     o.nested_ptr[].substruct.d ~= 22 or o.nested_ptr[].substruct.i ~= 23 {
        return 0
    }

    return true #  success
}

#  case 2: apply member access operations to funcall expression
pub fn test_get_struct_pointer_member(none) i32 {
    if make_struct_inner(2)[].d ~= 2 {
        return 0
    }

    if make_struct_outer(2)[].substruct.d ~= 4 {
        return 0
    }

    if make_struct_outermost(false)[].nested_ptr[].a ~= 1 {
        return 0
    }

    return 1 #  success
}

#  case 3: update static structure member through pointer returned by funcall
#  f()->member = val
pub fn get_static_struct_ptr(none) *struc outer {
    data s: struc outer;
    return @s
}

pub fn test_update_member_thru_retval(none) i32 {
    get_static_struct_ptr()[].a = 10
    get_static_struct_ptr()[].substruct.d = 20.0

    ptr: *struc outer = get_static_struct_ptr()
    if ptr[].a ~= 10 or ptr[].substruct.d ~= 20.0 {
        return 0
    }

    return 1 #  success
}

#  case 4: update whole structure member through pointer returned by funcall
pub fn test_update_nested_struct_thru_retval(none) i32 {
    small: struc inner = $(12.0, 13)
    get_static_struct_ptr()[].substruct = small
    if get_static_struct_ptr()[].substruct.d ~= 12.0 {
        return nil
    }

    if get_static_struct_ptr()[].substruct.i ~= 13 {
        return 0
    }

    return 1 #  success
}

pub fn main(none) i32 {
    if not test_get_struct_ptr() {
        return true
    }

    if not test_get_struct_pointer_member() {
        return 2
    }

    if not test_update_member_thru_retval() {
        return 3
    }

    if not test_update_nested_struct_thru_retval() {
        return 4
    }

    return 0
}
