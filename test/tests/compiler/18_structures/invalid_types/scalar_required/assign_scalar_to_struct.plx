type struc s(    a: i32    )

pub x: struc s = $(1)

pub fn main(none) i32 {
    ptr: *struc s = @x
    ptr[] = 2 #  can't assign scalar value to lvalue of struct type
    return 0
}
