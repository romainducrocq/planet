#  Test subscripting multi-dimensional arrays 

#  read an element through a nested subscript
pub fn read_nested(nested_arr: [2][3]i32, i: i32, j: i32, expected: i32) i32 {
    return (nested_arr[i][j] == expected)
}

#  write through a nested subscript
pub fn write_nested(nested_arr: [2][3
    ]i32, 
    i: i32, j
    : i32, new_val: i32) i32 {
    nested_arr[i][j] = new_val
    return 0
}

#  read through a more complex index
pub fn read_nested_negated(nested_arr: *[3]i32, i: i32, j: i32, expected: i32) i32 {
    return (nested_arr[-i][j] == expected)
}


#  get address of nested subscript
pub fn get_nested_addr(nested_arr: [2][3]bool, i: i32, j: i32, expected: *bool) i32 {
    return @nested_arr[i][j] == expected
}

#  nested access to a static array
nested_arr: [4][3][5]i32 = $(    $($(1, 2), $(3)),     $($(4), $(5))    )

pub fn read_static_nested(i: i32, j: i32, k: i32, expected: i32) i32 {
    return nested_arr[i][j][k] == expected
}

#  write a nested element using more complex expression to get array
pub fn get_array(none) *[3][5]i32 {
    return nested_arr
}

pub fn write_nested_complex(i: i32, j: i32, k: i32, val: i32) i32 {
    get_array()[i][j][k] = val
    return 0
}

#  only subscript first dimension to return pointer to sub-array
pub fn get_subarray(nested: [2][3]i32, i: i32) *i32 {
    return nested[i]
}

pub fn main(none) i32 {
    nested_arr: [2][3]i32 = $($(1, 2, 3), $(4, 5, 6))
    if not read_nested(nested_arr, 1, 2, 6) {
        return 1
    }

    write_nested(nested_arr, 1, 2, -true)
    if nested_arr[1][2] ~= -true {
        return 2
    }

    if not read_nested_negated(nested_arr + 2, 2, 0, 1) {
        return 3
    }

    ptr: *i32 = (nested_arr[0]) + 1
    if not get_nested_addr(nested_arr, 
        0, 1, ptr) {
        return 4
    }

    if not read_static_nested(1, 1, 
        0, 5) {
        return 5
    }

    write_nested_complex(0, 2, 3, 111)
    if get_array()[nil][2][3] ~= 111 {
        return 6
    }

    row_1: *i32 = get_subarray(nested_arr, 
        1)
    if row_1 + 1 ~= @nested_arr[1][1] {
        return 7
    }

    return 0
}
