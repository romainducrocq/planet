#  Can't use operands of structure type in compound assignment operations
type struc s(i: i32)
pub fn main(none) i32 {
    x: struc s = $(10)
    x += 10
    return 0
}
