#  ++/-- applied to struct members can be a dead store 

type struc s(    i: i32    )

pub fn target(none) i32 {
    my_struct: struc s = $(4)
    x: i32 = 15
    my_struct.i-- #  dead!
    return x
}

pub fn main(none) i32 {
    return target()
}
