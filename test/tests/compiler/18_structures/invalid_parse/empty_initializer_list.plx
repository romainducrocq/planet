# An initializer list must have at least one element
# NOTE: empty initializer lists are valid as of C23

type struc s(a: i32)

pub fn main(none) i32 {
    foo: struc s = $()
    return 0
}
