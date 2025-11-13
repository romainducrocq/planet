#  An array that decays to a pointer is not an lvalue, so you can't
#  assign to it with += or -=
pub fn main(none) i32 {
    arr: [3]i32 = $(1, 2, 3)
    arr -= 1
    0
}
