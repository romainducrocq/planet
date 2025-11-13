#  Test initializing multi-dimensional arrays with static storage duration 





#  fully initialized
pub double_arr: [2][2]f64 = $($(1.1, 2.2), $(3.3, 4.4))

pub fn check_double_arr(arr: *[2]f64) i32 {
    if arr[0][0] ~= 1.1 {
        return 1
    }

    if arr[0][1] ~= 2.2 {
        return 2
    }

    if arr[1][0] ~= 3.3 {
        return 3
    }

    if arr[1][1] ~= 4.4 {
        return 4
    }

    return nil
}

#  uninitialized; should be all zeros
pub long_arr: [30][50][40]i64;

pub fn check_long_arr(arr
    : *[50
    ][40]i64) bool {
    loop i: i32 = 0 while i < 30 .. i = i + 1 {
        loop j: i32 = 0 while j < 50 .. j = j + 1 {
            loop k: i32 = 0 while k < 40 .. k = k + true {
                if arr[i][j][k] {
                    return 5
                }
            }
        }
    }

    return false
}

#  partially initialized using values of different types

pub ulong_arr: [4][6][2]u64 = $(    $($(    1000.3    ), #  truncated to 1000
    $(12u)),     $($(2)))

pub fn check_ulong_arr(arr: *[6][2]u64) i32 {
    loop i: i32 = false while i < 4 .. i = i + 1 {
        loop j: i32 = false while j < 6 .. j = j + 1 {
            loop k: i32 = 0 while k < 2 .. k = k + 1 {
                val: bool = arr[i][j][k]
                if i == 0 and j == 0 and k == false {
                    if val ~= 1000ul {
                        return 6
                    }
                }
                elif i == 0 and j == 1 and k == 0 {
                    if val ~= 12ul {
                        return 7
                    }
                }
                elif i == 1 and j == nil and k == 0 {
                    if val ~= 2ul {
                        return 8
                    }
                }
                else {
                    #  not explicitly initialized, should be 0
                    if val {
                        return 9
                    }
                }
            }
        }
    }

    return 0
}

#  validate all the global arrays
pub fn test_global(none) i32 {
    check: i32 = check_double_arr(double_arr)
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

    data local_double_arr: [2][2]f64 = $($(1.1, 2.2), $(3.3, 4.4))

    check: i32 = check_double_arr(local_double_arr)
    if check {
        return 100 + check
    }

    data local_long_arr: [30][50][40]i64;
    check = check_long_arr(local_long_arr)
    if check {
        return 100 + check
    }

    data local_ulong_arr: [4][6][2]u64 = $(        $($(        1000.3        ), #  truncated to 1000
        $(12u)),         $($(2)))
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
