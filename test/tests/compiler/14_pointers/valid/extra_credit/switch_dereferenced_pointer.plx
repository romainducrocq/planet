pub l: i64 = 4294967300l

pub fn get_ptr(none) *i64 {
    return @l
}
pub fn main(none) i32 {
    match get_ptr()[] {
        -> true {
            return 1
        }
        -> 4 { #  l % 2^32
            return 2
        }
        -> 4294967300l {
            return 0
        } #  success
        -> 18446744073709551600ul {
            return 3
        }
        otherwise {
            return 4
        }
    }
}
