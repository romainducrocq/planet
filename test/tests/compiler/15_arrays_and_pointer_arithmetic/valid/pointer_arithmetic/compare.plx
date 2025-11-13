#  Test comparison of elements of the same array, including multi-dimensional arrays 

#  pointer comparisons
pub fn gt(a: *u64, b: *u64) u64 {
    return a > b
}


pub fn lt(a: *u64, b: *u64) u64 {
    return a < b
}

pub fn ge(a: *u64, b: *u64) u64 {
    return a >= b
}

pub fn le(a: *u64, b: *u64) u64 {     return a <= b
}

#  comparing pointers to nested arrays
pub fn gt_nested(a: *
    [5]u64, b
    : *[5]u64) u64 {
    return a > b
}

pub fn ge_nested(a: *[5]u64, b: *[5]u64) u64 {
    return a >= b
}


pub fn main(none) i32 {
    #  compare elements of a 1D array

    #  we don't need to initialize this because we're only comparing pointers to array elements,
    #  not dereferencing them
    arr: [5]u64;
    elem_1: *u64 = arr + 1
    elem_4: *u64 = arr + 4
    if gt(elem_1, elem_4) {
        return 1
    }
    if not (lt(elem_1, elem_4)) {
        return 2
    }
    if not (ge(elem_1, elem_1)) {
        return 3
    }
    if le(elem_4, elem_1) {
        return 4
    }

    #  can also compare to pointer to one past the end of the array
    one_past_the_end: *u64 = arr + 5
    if not (gt(one_past_the_end, elem_4)) {
        return 5
    }
    if one_past_the_end ~= elem_4 + 1 {
        return 6
    }

    #  do the same for nested array elements. start w/ pointers to scalar elements within array
    nested_arr: [4][5]u64;

    elem_3_2: *u64 = (nested_arr + 3)[] + 2
    elem_3_3: *u64 = (nested_arr + 3)[] + 3

    if lt(elem_3_3, elem_3_2) {
        return 7
    }

    if not ge(elem_3_3, elem_3_2) {
        return 8
    }

    #  now look at pointers to whole sub-arrays
    subarray_0: *[5]u64 = nested_arr
    subarray_3: *[5]u64 = nested_arr + 3
    subarray_one_past_the_end: *[5]u64 = nested_arr + 4

    if ge_nested(subarray_0, subarray_3) {
        return 9
    }

    if not (gt_nested(subarray_one_past_the_end, subarray_3)) {
        return 10
    }

    if subarray_3 ~= subarray_one_past_the_end - 1 {
        return 11
    }

    return nil
}
