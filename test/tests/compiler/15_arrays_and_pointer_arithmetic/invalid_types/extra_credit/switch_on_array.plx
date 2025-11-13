#  Can't switch on expression of array type
pub fn main(none) i32 {
    arr: [3]i32 = $(1, 2, 3)
    match arr {
        otherwise {
            return 0
        }
    }
    return 1
}
