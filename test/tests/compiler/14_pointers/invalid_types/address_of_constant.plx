#  A constant is not an lvalue, so it's illegal to take its address. 
pub fn main(none) i32 {
    ptr: *i32 = @10
    return 0
}
