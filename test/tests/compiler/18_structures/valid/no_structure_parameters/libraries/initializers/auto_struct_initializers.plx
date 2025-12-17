#  Test initialization of non-nested structs with automatic storage duration,
#  * including:
#  * - partial initialization
#  * - implicit type conversions
#  * - compound and single expressions as initializers
#  * - string literals as pointer and array initializers
#  * 

import "auto_struct_initializers"

pub fn validate_full_initialization(ptr: *struc s) i32 {
    if strcmp(ptr[].one_msg, "I'm a struct!") or ptr[].two_arr[0] ~= 's' or     ptr[].two_arr[1] ~= 'u' or ptr[].two_arr[2] ~= 'p' or     ptr[].three_self_ptr ~= ptr or ptr[].four_d ~= 2e12 or     ptr[].five_d_ptr[] ~= 2e12 {
        return 0
    }

    return 1 #  success
}

pub fn validate_partial_initialization(ptr: *struc s, expected_msg: string) i32 {
    if ptr[].one_msg ~= expected_msg or ptr[].two_arr[0] ~= 'a' or     ptr[].two_arr[1] ~= 'b' {
        return 0
    }

    #  validate ptr->three_self_ptr by making sure one element in it is 0
    if ptr[].three_self_ptr[].one_msg {
        return 0
    }

    #  validate elements that weren't explicitly initialized are 0
    if ptr[].two_arr[2] or ptr[].four_d or ptr[].five_d_ptr {
        return 0
    }

    return 1 #  success
}
pub fn validate_converted(ptr: *struc s) i32 {
    if (not ptr[].one_msg or #  just validate that this pointer isn't null
    ptr[].two_arr[0] ~= 220 or ptr[].two_arr[1] ~= 232 or     ptr[].two_arr[2] ~= 224 or ptr[].three_self_ptr or     ptr[].four_d ~= 2999.0 or ptr[].five_d_ptr[] ~= 0.0) {
        return 0
    }

    return 1 #  success
}

pub fn validate_two_structs(ptr1: *struc s, ptr2: *struc s) i32 {
    #  validate elements of ptr2
    if (strcmp(ptr2[].one_msg, "Yet another string") or     ptr2[].one_msg ~= ptr1[].one_msg or #  both one_msg members point to same
    #  string literal
    #  contents of two_arr copied from s1 to s2
    ptr2[].two_arr[0] ~= 'x' or ptr2[].two_arr[1] ~= 'y' or     ptr2[].three_self_ptr ~=     ptr1 or #  ptr2->three_self_ptr is ptr1, not to itself
    ptr2[].four_d ~= 150.0 or     ptr1[].five_d_ptr[] ~= 123.4) {
        return 0
    }

    #  ptr1->two_arr and ptr2->two_arr are distinct arrays with different
    #  addresses, even though contents are the same
    if ptr1[].two_arr == ptr2[].two_arr {
        return 0
    }
    return 1 #  success
}
