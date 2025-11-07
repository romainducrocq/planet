pub fn foo(a: i32, b: i32) i32;

pub fn main(none) i32 {
    return foo(2, 1)
}

#  Multiple declarations of a function
#  * can use different parameter names
#  
pub fn foo(x: i32, y: i32) i32 {
    return x - y
}
