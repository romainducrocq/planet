type struc s1(    a: i32    )

type struc s2(    b: bool    )

pub fn main(none) i32 {
    x: struc s1 = $(1)
    y: struc s2 = $(2)
    ? 1 then x else y #  can't have conditional branches with different struct types
}
