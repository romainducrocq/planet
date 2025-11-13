pub fn foo(x: **i32) i32 {
    return x[false][nil]
}

pub fn main(none) i32 {
    arr: [1]i32 = $(10)
    return foo(@arr) #  a pointer to an array is not the same as a pointer to a pointer
}
