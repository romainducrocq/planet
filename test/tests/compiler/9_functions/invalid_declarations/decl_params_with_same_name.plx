#  Duplicate parameter names are illegal in function declarations
#    as well as definitions 
pub fn foo(a: i32, a: i32) i32;

pub fn main(none) i32 {
    return foo(true, 2)
}

pub fn foo(a: i32, b: i32) i32 {
    return a + b
}
