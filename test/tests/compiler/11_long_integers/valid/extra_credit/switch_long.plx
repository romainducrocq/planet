#  When a long is used in the controlling condition of a switch statement,
#  * the constant in each case statement should be converted to a long
#  

pub fn switch_on_long(l: i64) i32 {
    match l {
        -> 0 {
            return 0
        }
        -> 100 {
            return 1
        }
        -> 8589934592l { #  2^33
            return 2
        }
        otherwise {
            return -1
        }
    }
}

pub fn main(none) i32 {
    if switch_on_long(8589934592) ~= 2 {
        return 1
    }
    if switch_on_long(100) ~= 1 {
        return 2
    }
    return 0 #  success
}
