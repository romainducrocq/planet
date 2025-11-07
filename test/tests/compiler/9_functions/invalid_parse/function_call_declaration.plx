pub fn foo(a: i32) i32 {
    return 0
}

pub fn main(none) i32 {
    # A function argument must be an expression, not a declaration
    return foo(a: i32;)
}
