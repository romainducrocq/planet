#  The result of a ternary expression is not
#  * an lvalue, even if the second and third operands
#  * are both variables, so it's illegal to take its address.
#  
pub fn main(none) i32 {
    x: i32 = 1
    y: i32 = 2
    z: i32 = 3
    ptr: *i32 = @(? x then y else z)
    return 0
}
