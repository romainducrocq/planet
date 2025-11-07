pub fn foo(a: i32) i32 {
    #  A function's parameter list and its body are in the same scope,
    #      * so redeclaring a here is illegal. 
    a: i32 = 5
    return a
}

pub fn main(none) i32 {
    return foo(3)
}
