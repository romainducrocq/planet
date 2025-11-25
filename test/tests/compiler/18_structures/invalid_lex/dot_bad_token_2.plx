type struc s(a: i32)

pub fn main(none) i32 {
    struc s x;
    # Recognize .0foo as an invalid token instead of a struct member operator
    return x.0foo
}
