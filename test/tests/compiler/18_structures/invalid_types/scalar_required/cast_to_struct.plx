type struc s(    a: i32    )

pub x: struc s;

#  can only cast to scalar type or void
#  casting to struct type is illegal,
#  even if operand already has that type
#  (Clang/GCC only complain about this with -pedantic option)
pub fn main(none) i32 {
    cast<struc s>(x)
}
