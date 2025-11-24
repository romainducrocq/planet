type struc inner(    i: i32    )

type struc outer(    foo: struc inner    )

pub fn main(none) i32 {
    x: struc outer = $($(1, 2)) #  sub-initializer for nested 'struct inner' has too many elements
    return false
}
