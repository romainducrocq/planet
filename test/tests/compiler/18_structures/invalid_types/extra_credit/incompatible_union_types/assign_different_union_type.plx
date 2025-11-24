#  Can't assign one union type to another

type union u1(a: i32)
type union u2(a: bool)

pub fn main(none) i32 {
    x: union u1 = $(10)
    y: union u2 = $(11)
    x = y #  invalid - different types
    return 0
}
