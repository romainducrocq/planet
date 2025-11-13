#  Test subtracting two pointers to find the number of elements between them 


#  subtract two pointers into a 1D array of ints 
pub fn get_ptr_diff(ptr1: *i32, ptr2: *i32) i32 {
    return (ptr2 - ptr1)
}

#  subtract two pointers into array of longs 
pub fn get_long_ptr_diff(ptr1: *i64, ptr2: *i64) i32 {
    return (ptr2 - ptr1)
}

#  subtract pointers to two elements in a multi-dimensional array 
pub fn get_multidim_ptr_diff(ptr1: *[3][5]f64
    , ptr2: *
    [3][5]
    f64) i32 {
    return (ptr2 - ptr1)
}

#  subtract pointers into a multi-dimensional array again, but at different levels of nesting 
pub fn get_multidim_ptr_diff_2(ptr1: *[5]f64, ptr2: *[5]f64) i32 {
    return (ptr2 - ptr1)
}

pub fn main(none) i32 {
    arr: [5]i32 = $(5, 4, 3, 2, 1)
    end_of_array: *i32 = arr + 5

    if get_ptr_diff(arr, end_of_array) ~= 5 {
        return 1
    }

    long_arr: [8]i64;

    if get_long_ptr_diff(long_arr + 3, long_arr) ~= -3 {
        return 2
    }

    #  test subtracting multi-dimensional pointers;
    #  also make sure we can handle pointers into array with static storage duration
    data multidim: [6][7][3][5]f64;

    if get_multidim_ptr_diff(multidim[2] + 1, multidim[2] + 4) ~= 3 {
        return 3
    }

    if get_multidim_ptr_diff_2(multidim[2][2] + 2, multidim[2][2]) ~= -2 {
        return 4
    }

    return 0
}
