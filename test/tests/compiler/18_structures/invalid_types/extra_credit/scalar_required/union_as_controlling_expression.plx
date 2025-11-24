#  Can't use union as controlling expression

type union u(x: i32)

pub fn main(none) i32 {
    my_union: union u = $(10)
    if my_union {
        return 1
    }
    return 0
}
