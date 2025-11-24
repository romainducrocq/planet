#  Can't perform compound assignment with lval of struct type, including
#  nested structs

type struc inner(    i: i32    )

type struc outer(    s: struc inner    )

pub fn main(none) i32 {
    x: struc outer = $($(1))
    x.s *= 10
    return 0
}
