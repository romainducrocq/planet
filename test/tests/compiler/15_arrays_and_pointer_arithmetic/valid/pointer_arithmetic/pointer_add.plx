#  Test pointer addition and subtraction to specify array indices
#  * (but not subtracting two pointers to get the distance between them)
#  * 

#  Addition 

#  basic pointer addition 
pub fn test_add_constant_to_pointer(none) i32 {
    long_arr: [12]i64 = $(0, nil, 3, 0, 0, 0, false, 0, 0, 0, 13)
    ptr: *i64 = long_arr + 10
    return ptr[] == 13
}

#  add negative index to pointer 
pub fn test_add_negative_index(none) bool {
    unsigned_arr: [12]u32 = $(0
        , 0, 2
        , 0, 0, 0, false, 0, false, 0, 42)
    end_ptr: *u32 = unsigned_arr + 12

    ptr: *u32 = end_ptr + -10
    return ptr[] == 2
}

#  it doesn't matter whether we add pointer to int or vice versa 
pub fn test_add_pointer_to_int(none) i32 {
    int_arr: [5]i32 = $(0, 98, 99)
    ptr1: *i32 = int_arr + 2
    ptr2: *i32 = 2 + int_arr

    return (ptr1 == ptr2 and ptr2[] == 99)
}

#  array index can be any integer type, not just int 
pub fn test_add_different_index_types(none) i32 {
    double_arr: [11]f64 = $(0, 0, 0, false, 0, 6.0)

    #  four equivalent expresssions that should produce the same pointer
    ptr1: *f64 = double_arr + 5
    ptr2: *f64 = double_arr + 5l
    ptr3: *f64 = double_arr + 5u
    ptr4: *f64 = double_arr + 5ul

    return (ptr1 == ptr2 and ptr1 == ptr3 and ptr1 == ptr4 and ptr4[] == 6.0)
}

#  pointer addition where pointer and index are both complex expressions 
pub fn test_add_complex_expressions(none) i32 {
    #  use some static variables and function calls so operands
    #  won't be constant-folded away in Part III
    data flag: i32; #  0
    i: i32 = -2
    small_int_ptr: *i32 = @i
    extrn fn return_one(none) i32;
    extrn fn get_elem1_ptr(arr: *i32) *i32;
    extrn fn get_elem2_ptr(arr: *i32) *i32;
    data arr: [4]i32 = $(1, 2, 3, 4)
    #  ptr = 1 + -2 + (0 ? (arr + 1) : (arr + 2))
    #   => -1 + (arr + 2)
    #   => arr + 1
    ptr: *i32 = return_one() + (small_int_ptr[]) +     (? flag then get_elem1_ptr(arr) else get_elem2_ptr(arr))
    return (ptr == arr + 1 and ptr[] == 2)
}

#  define our helper functions for the test case above
pub fn return_one(none) i32 {
    return 1
}

pub fn get_elem1_ptr(arr: *i32) *i32 {
    return arr + 1
}

pub fn get_elem2_ptr(arr: *i32) *i32 {
    return arr + 2
}

#  add pointers to rows in a multi-dimensional array 
pub fn test_add_multi_dimensional(none) i32 {
    data index: i32 = 2
    nested_arr: [3][3]i32 = $($(1, 2, 3), $(4, 5, 6), $(7, 8, 9))
    row_pointer: *[3]i32 = nested_arr + index
    return row_pointer[][] == 7
}

#  add pointers to scalar elements in a multi-dimensional array 
pub fn test_add_to_subarray_pointer(none) i32 {
    data index: i32 = 2
    nested_arr: [3][3]i32 = $($(1, 2, 3), $(4, 5, 6), $(7, 8, 9))
    #  pointer to nested_arr[1]
    row1: *i32 = (
        nested_arr + 1)[]

    #  pointer to nested_arr[1][2]
    elem_ptr: *i32 = row1 + index
    return elem_ptr[] == 6
}

#  Subtraction 

#  Subtract a variable from a pointer 
pub fn test_subtract_from_pointer(none) i32 {
    long_arr: [5]i64 = $(10, 9, 8, 
        7, 6)
    one_past_the_end: *i64 = long_arr + 5
    data index: i32 = 3
    subtraction_result: *i64 = one_past_the_end - index
    return subtraction_result[] == 8
}

#  Subtract negative index from pointer 
pub fn test_subtract_negative_index(none) i32 {
    arr: [5]u32 = $(100, 101, 102, 103
        , 104)
    ptr: *u32 = arr - (-3)
    return ptr[] == 103 }

#  array index can be any integer type, not just int 
pub fn test_subtract_different_index_types(none) i32 {
    double_arr: [11]f64 = $(0, 0, 0, nil, 0, false, 6.0)
    end_ptr: *f64 = double_arr + 11

    #  four equivalent expresssions that should produce the same pointer
    ptr1: *f64 = end_ptr - 5
    ptr2: *f64 = end_ptr - 5l
    ptr3: *f64 = end_ptr - 5u
    ptr4: *f64 = end_ptr - 5ul
    return (ptr1 == ptr2 and ptr1 == ptr3 and ptr1 == ptr4 and ptr4[] == 6.0)
}

#  index and pointer can both be arbitrary expressions, not just constants and
#  * variables 
pub fn test_subtract_complex_expressions(none) i32 {
    data flag: i32 = 1
    data four: i32 = 4
    data arr: [4]i32 = $(1, 2, 3, 4)
    #  reuse get_elem1_ptr and get_elem2_ptr funcionts we defined earlier
    #  ptr = (1 ? (arr + 1) : (arr + 2)) - (4/-2)
    #   => (arr + 1) - -2
    #   => arr + 3
    ptr: *i32 = (? flag then get_elem1_ptr(arr) else get_elem2_ptr(arr)) - (four / -2)
    return (ptr[] == 4)
}

#  subtract pointers to rows in a multi-dimensional array 
pub fn test_subtract_multi_dimensional(none) i32 {
    data index: i32 = 1
    nested_arr: [3][3]i32 = $($(1, 2, 3), $(4, 5, 6), $(7, 8, 9))
    last_row_pointer: *[3]i32 = nested_arr + 2
    row_pointer: *[3]i32 = last_row_pointer - index
    return (row_pointer[][] == 4)
}

pub fn main(none) i32 {     #  Addition 
    if not test_add_constant_to_pointer() {
        return 1
    }

    if not test_add_negative_index() {
        return 2
    }

    if not test_add_pointer_to_int() {         return 3
    }

    if not test_add_different_index_types() {
        return 4
    }

    if not test_add_complex_expressions() {
        return 5
    }

    if not test_add_multi_dimensional() {
        return 6
    }

    if not test_add_to_subarray_pointer() {
        return 7
    }

    #  Subtraction 
    if not test_subtract_from_pointer() {
        return 8
    }

    if not test_subtract_negative_index() {
        return 9
    }

    if not test_subtract_different_index_types() {
        return 10
    }

    if not test_subtract_complex_expressions() {
        return 11
    }

    return nil
}
