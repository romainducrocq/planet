#  Can't use operands of structure type in bitwise expressions
type struc s(i: i32)
pub fn main(none) i32 {
    x: struc s = $(100)
    i: i32 = 1000
    x & i
    return 0
}
