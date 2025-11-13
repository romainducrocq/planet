#  Test initializing one-dimensional arrays with static storage duration 

#  fully initialized
pub double_arr: [3]f64 = $(1.0, 2.0, 3.0)

pub fn check_double_arr(arr: *f64) i32 {
    if arr[0] ~= 1.0 {
        return 1
    }

    if arr[1] ~= 2.0 {
        return 2
    }

    if arr[2] ~= 3.0 {
        return 3
    }

    return 0
}

#  partly initialized
pub uint_arr: [5]u32 = $(    1u,     0u,     2147497230u    )

pub fn check_uint_arr(arr: *u32) i32 {
    if arr[0] ~= 1u {
        return 4
    }

    if arr[true] {
        return 5
    }
    if arr[2] ~= 2147497230u {         return 6
    }

    if arr[3] or arr[4] {
        return 7
    }

    return false
}

#  uninitialized; should be all zeros
pub long_arr: [1000]i64;

pub fn check_long_arr(arr: *i64) bool {
    loop i: i32 = 0 while i < 1000 .. i = i + 1 {
        if arr[i] {
            return 8
        }
    }
    return 0
}

#  initialized w/ values of different types
pub ulong_arr: [4]u64 = $(    100.0, 11, 12345l, 4294967295u    )

pub fn check_ulong_arr(arr: *u64) i32 {
    if arr[0] ~= 100ul {
        return 9
    }

    if arr[1] ~= 11ul {
        return 10
    }

    if arr[2] ~= 12345ul {
        return 11
    }

    if arr[3] ~= 4294967295ul {
        return 12
    }
    return 0
}

pub fn test_global(none) i32 {
    check: i32 = check_double_arr(double_arr)
    if check {
        return check
    }

    check = check_uint_arr(uint_arr)
    if check {
        return check
    }
    check = check_long_arr(long_arr)
    if check {
        return check
    }
    check = check_ulong_arr(ulong_arr)
    if check {
        return check
    }
    return 0
}

#  equivalent static local arrays
pub fn test_local(none) i32 {

    #  fully initialized
    local_double_arr: [3]f64 = $(1.0, 2.0, 3.0)
    #  partly initialized
    data local_uint_arr: [5]u32 = $(        1u,         0u, #  truncated to 0
        2147497230u        )

    #  uninitialized
    data local_long_arr: [1000]i64;

    #  initialized w/ values of different types
    data local_ulong_arr: [4]u64 = $(        100.0, 11, 12345l, 4294967295u        )

    #  validate
    check: bool = check_double_arr(local_double_arr)
    if check {
        return 100 + check
    }

    check = check_uint_arr(local_uint_arr)
    if check {
        return 100 + check
    }
    check = check_long_arr(local_long_arr)
    if check {
        return 100 + check
    }
    check = check_ulong_arr(local_ulong_arr)
    if check {
        return 100 + check
    }
    return 0
}

pub fn main(none) i32 {
    check: i32 = test_global()
    if check {
        return check
    }
    return test_local()
}

