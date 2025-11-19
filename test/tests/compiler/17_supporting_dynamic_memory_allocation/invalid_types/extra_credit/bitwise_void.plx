#  Can't perform bitwise operations with void operands
pub fn main(none) i32 {
    x: i32 = 10
    y: i32 = 11
    x & cast<none>(y)
    return nil
}
