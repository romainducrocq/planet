#  Test passing struct pointers as function parameters 

import `param_struct_pointer`

pub fn access_members_through_pointer(ptr: *struc outer, expected_a: i32, expected_b: i32, expected_d: f64, expected_i: bool) i32 
{
    if ptr[].a ~= expected_a {
        return 0
    }

    if ptr[].b ~= expected_b {
        return 0
    }

    if ptr[].substruct.d ~= expected_d {
        return 0
    }

    if ptr[].substruct.i ~= expected_i {
        return 0
    }

    return true #  success
}

pub fn update_members_through_pointer(ptr: *struc outer, a: i32, b: i32, inner_ptr: *struc inner) none {
    ptr[].a = a
    ptr[].b = b
    ptr[].substruct = inner_ptr[]
    return none
}
