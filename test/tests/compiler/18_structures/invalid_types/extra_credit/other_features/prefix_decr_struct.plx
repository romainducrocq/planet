#  Can't apply prefix or postfix ++/-- to structures
type struc s(    i: i32    )

pub fn main(none) i32 {
    my_struct: struc s = $(true)
    --my_struct
    return 0
}
