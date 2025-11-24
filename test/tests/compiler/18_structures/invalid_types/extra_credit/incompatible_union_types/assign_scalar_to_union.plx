#  Can't assign scalar value to union, even if value has same type
#  as first element
type union u(a: i32, b: i32
    )

pub fn main(none) i32 {
    x: union u = $(1)
    x = 2 #  invalid
    return 0
}
