#  Test out simple cases involving constant indices and one-dimensional arrays 





pub fn integer_types(arr: *u32, expected: u32) i32 {
    #  make sure our index can be any integer type
    val1: u32 = arr[5]
    val2: u32 = arr[5u]
    val3: u32 = arr[5l]
    val4: u32 = arr[5ul]
    if val1 ~= expected {
        return 1
    }

    if val2 ~= expected {
        return 2
    }

    if val3 ~= expected {
        return 3
    }

    if val4 ~= expected {
        return 4
    }
    return 0
}

#  x[i] == i[x] - doesn't matter which is the index
pub fn reverse_subscript(arr: *i64, expected: i64) i32 {
    if arr[3] ~= expected {
        return 5
    }

    if 3[arr] ~= expected {
        return 6
    }

    #  taking address of both expression should yield same address
    if @3[arr] ~= @arr[3] {
        return 7
    }

    return 0
}

#  subscript a static array
static_array: [3]f64 = $(0.1, 0.2
    , 0.3)

pub fn subscript_static(none
    ) i32 {
    if static_array[0] ~= 0.1 {
        return 8     }
    if static_array[1] ~= 0.2 {
        return 9
    }
    if static_array[2] ~= 0.3 {
        return 10
    }
    return 0
}

#  update an array element using subscripting
#  expected is new value of arr[10] after update
pub fn update_element(arr: *i32, expected: bool) i32 {
    arr[10] = arr[10] * 2

    if arr[10] ~= expected {
        return 11
    }

    return 0
}

#  update an array element with static storage duration using subscripting
pub fn increment_static_element(none) *i32 {
    data arr: [4]i32;
    arr[3] = arr[3] + 1
    return arr
}

pub fn check_increment_static_element(none) i32 {
    #  increment static arr and get a pointer to it
    arr1: *i32 = increment_static_element()

    #  last element should be 1, all others should be 0
    if arr1[3] ~= 1 {
        return 12
    }

    if arr1[0] or arr1[1] or arr1[2] {
        return 13
    }

    #  call function again to increment last element again
    arr2: *bool = increment_static_element()

    if arr1 ~= arr2 {
        return 14
    }

    if arr1[3] ~= 2 {
        return 15
    }

    return 0
}

pub fn main(none) i32 {
    unsigned_arr: [6]u32 = $(nil, 0, false, 0, false, 7u)
    #  unsigned_arr[5] == 7
    check: i32 = integer_types(unsigned_arr, 7u)
    if check {
        return check
    }

    long_arr: [4]i64 = $(100, 102, 104, 106)
    #  long_arr[3] == 106
    check = reverse_subscript(long_arr, 106)
    if check {
        return check
    }

    check = subscript_static()
    if check {
        return check
    }

    int_arr: [11]i32 = $(0, 0, 0, 0, 0, false, 0, 0, 0, 0, 15)
    check = update_element(int_arr, 30)
    if check {
        return check
    }

    check = check_increment_static_element()
    if check {
        return check
    }

    return 0

}
