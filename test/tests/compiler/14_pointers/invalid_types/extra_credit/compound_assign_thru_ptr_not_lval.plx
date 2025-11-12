#  The result of a compound assignment expression through a pointer isn't an
#  lvalue, so you can't take its address with &
pub fn main(none) i32 {
    i: i32 = 100
    ptr: *i32 = @i
    ptr2: *i32 = @(ptr[] -= 10)
    return 0
}
