#  Can't apply ++/-- to any structures, including nested ones
type struc inner(    i: i32    )
type struc outer(    s: struc inner    )
pub fn main(none) i32 {
    x: struc outer = $($(1))
    ++x.s
    return 0
}
