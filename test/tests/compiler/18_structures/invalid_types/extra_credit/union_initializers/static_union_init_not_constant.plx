#  The initializer for any static variable must be a constant,
#  * including variables of union type.
#  

type union u(a: i32, b: i32
    )

pub fn main(none) i32 {
    i: i32 = 10
    data my_union: union u = $(i)
    return 0
}
