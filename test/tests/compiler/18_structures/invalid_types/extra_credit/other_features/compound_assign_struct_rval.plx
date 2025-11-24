#  Can't use a structure type as the right operand in compound assignment
type struc s(i: i32)
pub fn main(none) i32 {
    i: i32 = 100
    x: struc s = $(100)
    i += x
    return 0
}
