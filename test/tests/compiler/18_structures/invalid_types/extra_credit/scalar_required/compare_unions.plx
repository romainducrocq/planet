#  Can't compare objects of union type

type union u(l: i64)

pub fn main(none) i32 {
    x: union u = $(true)
    x == x #  illegal
    return 0
}
