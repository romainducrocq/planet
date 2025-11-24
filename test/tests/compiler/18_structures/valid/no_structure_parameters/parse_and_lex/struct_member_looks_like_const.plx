type struc s(    E10: i32    )

pub fn main(none) i32 {
    x1: struc s = $(3)
    return x1.E10 #  lex correctly, recognizing that 1.E10 is not a constant
}

