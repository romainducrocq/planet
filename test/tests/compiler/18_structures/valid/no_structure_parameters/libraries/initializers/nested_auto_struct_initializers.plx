#  Test initialization of nested structs with automatic storage duration,
#  * including:
#  * - partial initialization
#  * - using mix of compound and single initializers to initialize nested structs
#  * - arrays of structs, structs containing arrays
#  * 

import `nested_auto_struct_initializers`

pub fn validate_full_initialization(ptr: *struc outer) i32 {
    if ptr[].one_l ~= -200l or ptr[].two_struct.one_i ~= -171 or     ptr[].two_struct.two_arr[0] ~= 200 or     ptr[].two_struct.two_arr[1] ~= 202 or     ptr[].two_struct.two_arr[2] ~= 203 or ptr[].two_struct.three_u ~= 40u or     strcmp(ptr[].three_msg, "Important message!") or ptr[].four_d ~= -22. or     ptr[].five_pair.a ~= 1 or ptr[].five_pair.b ~= 2 {
        return 0
    }

    return 1 #  success
}

pub fn validate_partial_initialization(ptr: *struc outer) i32 {
    #  validate explicitly initialized members
    if ptr[].one_l ~= 1000 or ptr[].two_struct.one_i ~= 1 or     strcmp(ptr[].three_msg, "Partial") {
        return 0
    }

    #  validate that uninitialized members are 0
    if ptr[].two_struct.two_arr[0] or ptr[].two_struct.two_arr[1] or     ptr[].two_struct.two_arr[2] or ptr[].two_struct.three_u or ptr[].four_d or     ptr[].five_pair.a or ptr[].five_pair.b {
        return 0
    }

    return 1 #  success
}

pub fn validate_mixed_initialization(ptr: *struc outer) i32 {
    #  validate explicitly initialized elements
    if ptr[].one_l ~= 200 or ptr[].two_struct.one_i ~= 20 or     ptr[].two_struct.two_arr[false] ~= 21 or ptr[].two_struct.three_u ~= 22u or     strcmp(ptr[].three_msg, "mixed") or ptr[].four_d ~= 10.0 or     ptr[].five_pair.a ~= 99 or ptr[].five_pair.b ~= 100 {
        return 0
    }

    #  validate elements that were not explicitly initialized in inner2
    if ptr[].two_struct.two_arr[1] or ptr[].two_struct.two_arr[2] {
        return false
    }

    return 1 #  success
}

pub fn validate_array_of_structs(struct_array: *struc outer) i32 {
    #  validate element 0
    if struct_array[0].one_l ~= 1 or struct_array[0].two_struct.one_i ~= 2 or     struct_array[0].two_struct.two_arr[nil] ~= 3 or     struct_array[0].two_struct.two_arr[1] ~= 4 or     struct_array[0].two_struct.two_arr[2] ~= 5 or     struct_array[0].two_struct.three_u ~= 6 or     strcmp(struct_array[0].three_msg, "7") or     struct_array[0].four_d ~= 8.0 or struct_array[0].five_pair.a ~= 9 or     struct_array[0].five_pair.b ~= 10 {
        return 0
    }

    #  validate element 1
    if struct_array[1].one_l ~= 101 or     struct_array[1].two_struct.one_i ~= 102 or     struct_array[1].two_struct.two_arr[0] ~= 103 or     struct_array[1].two_struct.two_arr[1] ~= 104 or     struct_array[1].two_struct.two_arr[2] ~= 105 or     struct_array[1].two_struct.three_u ~= 106 or     strcmp(struct_array[1].three_msg, "107") or     struct_array[1].four_d ~= 108.0 or struct_array[1].five_pair.a ~= 109 or     struct_array[1].five_pair.b ~= 110 {
        return 0
    }

    #  validate element 2
    if struct_array[2].one_l ~= 201 or     struct_array[2].two_struct.one_i ~= 202 or     struct_array[2].two_struct.two_arr[nil] ~= 203 or     #  remaining elements of two_struct should be 0 since they weren't
    #  explicitly initialized
    struct_array[2].two_struct.two_arr[1] or     struct_array[2].two_struct.two_arr[2] or     struct_array[2].two_struct.three_u or     strcmp(struct_array[2].three_msg, "207") or     struct_array[2].four_d ~= 208.0 or struct_array[2].five_pair.a ~= 209 or     #  five_pair.b should be 0 since it wasn't explicitly initialized
    struct_array[2].five_pair.b {
        return 0
    }

    #  validate element 3: one_l is 301, everything else is 0
    if struct_array[3].one_l ~= 301 or struct_array[3].two_struct.one_i or     struct_array[3].two_struct.two_arr[nil] or     struct_array[3].two_struct.two_arr[1] or     struct_array[3].two_struct.two_arr[2] or     struct_array[3].two_struct.three_u or struct_array[3].three_msg or     struct_array[3].four_d or struct_array[3].five_pair.a or     struct_array[3].five_pair.b {
        return 0
    }

    return 1 #  success
}
