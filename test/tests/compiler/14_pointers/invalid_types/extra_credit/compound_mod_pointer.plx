#  A pointer can't appear as the left or right operand
#  * of the *=, /=, or %= operator
#  
pub fn main(none) i32 {
    i: i32 = 10
    ptr: *i32 = @i
    i %= ptr
    return 0
}
