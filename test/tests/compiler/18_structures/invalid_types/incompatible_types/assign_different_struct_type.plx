#  can't assign one struct type to another

type struc s1(    field: i32    )

type struc s2(    field: bool    )

pub fn main(none) i32 {
    a: struc s1 = $(1)
    b: struc s2;
    b = a #  can't assign to struct s2 from struct s1
    return b.field
}
