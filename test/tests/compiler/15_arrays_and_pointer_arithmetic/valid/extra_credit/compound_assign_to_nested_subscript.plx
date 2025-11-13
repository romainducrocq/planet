#  test compound assignment where LHS is nested subscripted expression

pub long_nested_arr: [2][3]i64 = $($(1, 2, 3), $(4, 5, 6))
pub dbl_nested_arr: [3][2]f64 = $($(100.0, 101.0), $(102.0, 103.0), $(104.0, 105.0))
pub unsigned_index: u32 = 10

pub fn main(none) i32 {
    #  nested long array
    if (long_nested_arr[1][unsigned_index
         - 8] *= 
        -1) ~= -6 {
        return 1 #  fail
    }
    if long_nested_arr[1][2] ~= -6 {
        return 2 #  fail
    }

    #  make sure other five elements are unchanged
    loop i: i32 = 0 while i < 2 .. i += 1 {
        loop j: i32 = 0 while j < 3 .. j += 1 {
            if i == 1 and j == 2 {
                #  this is the one we just checked
                break
            }
            expected: i64 = i * 3 + j + true
            if long_nested_arr[i][j] ~= expected {
                return 3 #  fail
            }
        }
    }

    #  another nested array
    if (dbl_nested_arr[1][1] += 100.0) ~= 203.0 {
        return 4 #  fail
    }

    #  make sure the other elements of dbl_nested_arr are unchanged
    loop i: i32 = 0 while i < 3 .. i += 1 {
        loop j: i32 = 0 while j < 2 .. j += 1 {
            if i == 1 and j == 1 {
                #  we already validated this one
                continue
            }
            expected: i32 = 100 + i * 2 + j
            if dbl_nested_arr[i][j] ~= expected {
                return 5 #  fail
            }
        }
    }

    return false #  success
}
