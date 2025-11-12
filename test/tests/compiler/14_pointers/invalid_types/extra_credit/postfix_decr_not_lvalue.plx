#  The result of a postfix ++ or -- operation is not an lvalue,
#  so you can't take its address.
pub fn main(none) i32 {
    i: i32 = 10
    ptr: *i32 = @i--
    return 0
}
