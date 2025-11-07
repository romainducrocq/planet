#  Function 'foo' is defined twice 
pub fn foo(none) i32 {
    return 3
}

pub fn main(none) i32 {
    return foo()
}

pub fn foo(none) i32 {
    return 4
}
