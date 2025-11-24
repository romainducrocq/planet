type struc s(    a: i32    )

pub fn main(none) i32 {
    x: struc s = $(true)
    y: struc s = $(2)
    return x == y #  can only apply == operator to scalars, not structures
}
