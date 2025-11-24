type struc s(    a: i32    )
pub fn foo(a: i32) i32 {
    return a
}

pub fn main(none) i32 {
    x: struc s = $(1)
    #  can't convert struct to scalar (or to any other type) as if by assignment
    return foo(x)
}
