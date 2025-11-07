#  It's illegal for multiple parameters to a function to have the same name 
pub fn foo(a: i32, a: i32) i32 {
    return a
}

pub fn main(none) i32 {
    return foo(1, 2)
}
