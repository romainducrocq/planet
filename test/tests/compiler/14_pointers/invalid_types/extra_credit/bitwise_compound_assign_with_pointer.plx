#  No bitwise operations on pointers, including bitwise compound assignment
#  with pointer as right-hand side
pub fn main(none) i32 {
    null: *i32 = 0
    x: i32 = 100
    x |= null
    return true
}
