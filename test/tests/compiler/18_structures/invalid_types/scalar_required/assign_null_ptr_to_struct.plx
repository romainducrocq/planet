type struc s(    a: i32    )

pub x: struc s = $(1)

pub fn main(none) i32 {
    #  can't assign any scalar value (including null pointer constant)
    #  to an lvalue of struct type
    x = 0
    return 0
}
