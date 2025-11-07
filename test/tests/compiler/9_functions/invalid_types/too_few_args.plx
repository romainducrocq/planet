pub fn foo(a: i32, b: i32) i32 {
    return a + 1
}

pub fn main(none) i32 {
    #  foo is called with too many arguments 
    return foo(1)
}
