pub fn main(none) i32 {
    a: i32 = 10
    #  a function declaration is a separate scope,
    #  so parameter 'a' doesn't conflict with variable 'a' above
    fn f(a: i32) i32;
    return f(a)
}

pub fn f(a: i32) i32 {
    return a * 2
}
