#  Function 'foo' is defined twice 
pub fn foo(none) i32 {
    return 3
}

pub fn main(none) i32 {
    #  after seeing this declaration, we should still remember that
    #  foo was defined earlier
    fn foo(none) i32;
    return foo()
}

pub fn foo(none) i32 {
    return 4
}
