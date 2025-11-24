type struc s(    a: i32    )

pub fn main(none) i32 {
    x: struc s = $(true)
    #  can't use structure as controlling expression in if statement
    if x {
        return 1
    }
    return 0
}
