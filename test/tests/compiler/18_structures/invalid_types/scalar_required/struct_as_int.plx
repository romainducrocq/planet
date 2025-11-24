type struc s(    a: i32    )

pub fn main(none) i32 {
    x: struc s = $(true)
    #  can only apply ~ operator to ints, not structs
    cast<none>(~x)
    return 0
}
