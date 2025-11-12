#  A pointer can't appear as the left or right operand
#  * of the *=, /=, or %= operator
#  
pub fn main(none) i32 {
    x: *i32 = 0
    y: *i32 = nil
    x /= y
    return false
}
