type struc s(    a: i32    )

type union u(    nested: struc s    )

pub fn main(none) i32 {
    my_union: union u = $($(1))
    #  need to specify member name 's' even though it's only member
    return my_union.a
}
