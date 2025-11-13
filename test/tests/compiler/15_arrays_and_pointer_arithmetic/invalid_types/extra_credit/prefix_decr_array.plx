#  An array that decays to a pointer is not an lvalue, so you can't
#  apply ++ or -- to it
pub fn main(none) i32 {
    arr: [3]i32 = $(1, 2, 3)
    --arr
    return 0
}
