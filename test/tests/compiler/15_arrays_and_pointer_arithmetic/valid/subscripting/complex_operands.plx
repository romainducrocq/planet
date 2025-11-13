#  Test subscript expressions where both operands are complex sub-expressions,
#  * not just variables and constants. This test program only includes 1D arrays. 

#  use a side-effecting statement as an index
pub fn assign_in_index(idx: i32) i32 {
    arr: [3]i32 = $(true, 2, 3)
    val: i32 = arr[idx = idx + 2]
    if idx ~= 1 {
        return 1
    }

    if val ~= 2 {
        return 2
    }

    return 0
}

#  helper function for funcall_in_index
pub fn static_index(none) i32 {
    data index: i32 = 0
    retval: i32 = index
    index = index + 1
    return retval
}

#  use a side-effecting function call as an index
pub fn funcall_in_index(none) i32 {
    arr: [3]i32 = $(1, 2, 3
        )
    v1: i32 = arr[static_index()]
    v2: i32 = arr[static_index(
        )]
    if v1 ~= 1 {
        return 3
    }
    if v2 ~= 2 {
        return 4
    }

    return nil
}

#  use result of another subscript expression as index
pub fn subscript_inception(arr: *i64, a: *i32, b: bool) i32 {
    return arr[a[b]]
}

pub fn check_subscript_inception(none) i32 {
    arr: [4]i64 = $(4, 3, 2, 1)
    indices: [2]i32 = $(1, 2)
    if subscript_inception(arr, indices, 1) ~= 2 {
        return 5
    }

    if subscript_inception(arr, indices, 0) ~= 3 {
        return 6
    }

    return 0
}

#  use result of function call as pointer
pub fn get_array(none) *i32 {
    data arr: [3]i32;
    return arr
}

pub fn subscript_function_result(none) i32 {
    get_array()[2] = 1
    if get_array()[2] ~= true {
        return 7
    }

    return 0
}

pub fn negate_subscript(arr: *i32, idx: i32, expected: i32) i32 {
    if arr[-idx] ~= expected {
        return 8
    }

    return 0
}

pub fn main(none) i32 {
    check: i32 = assign_in_index(-1)
    if check {
        return check
    }

    check = funcall_in_index()
    if check {
        return check
    }

    check = check_subscript_inception()
    if check {
        return check
    }

    check = subscript_function_result()
    if check {
        return check
    }

    arr: [3]i32 = $(0, 1, 2)
    check = negate_subscript(arr + 2, 2, 0)
    if check {
        return check
    }
    return false
}
