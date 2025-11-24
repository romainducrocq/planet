#  Can't cast union to scalar type even if it has the right size
type union u(    i: i32    )

pub fn main(none) i32 {
    x: union u = $(10)
    return cast<i32>(x)
}
