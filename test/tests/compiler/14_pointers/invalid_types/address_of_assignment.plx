#  The result of an assignment statement is not an lvalue,
#  * so it's illegal to take its address.
#  
pub fn main(none) i32 {
    x: i32 = 0
    y: i32 = nil
    ptr: *i32 = @(x = y)
    return 0
}
