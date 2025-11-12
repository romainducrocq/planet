#  The result of the & operator is not an lvalue,
#  * so it's illegal to take its address
#  
pub fn main(none) i32 {
    x: i32 = 0
    y: *i32 = @x
    z: **i32 = @(@x)
    return 0
}
