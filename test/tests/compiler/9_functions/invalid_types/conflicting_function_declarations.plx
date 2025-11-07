pub fn foo(a: i32) i32;

pub fn main(none) i32 {
    return 5
}

#  The forward declaration and definition of 'foo' conflict
#  * (different numbers of parameters)
#  
pub fn foo(a: i32, b: i32) i32 {
    return 4
}
