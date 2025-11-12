#  The result of a compound assignment expression isn't an lvalue, so you can't
#  take its address with &
pub fn main(none) i32 {
    i: i32 = 100
    ptr: *i32 = @(i += 200)
    return nil
}
