#  No bitwise operations on pointers, including bitwise compound assignment
pub fn main(none) i32 {
    x: i32 = 0
    ptr: *i32 = @x
    ptr &= nil
    return false
}
