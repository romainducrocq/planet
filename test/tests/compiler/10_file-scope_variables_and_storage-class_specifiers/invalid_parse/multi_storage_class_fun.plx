# A function declaration can't have multiple storage class keywords
extrn pub fn foo(none) i32 {
    return 0
}

pub fn main(none) i32 {
    return foo()
}
