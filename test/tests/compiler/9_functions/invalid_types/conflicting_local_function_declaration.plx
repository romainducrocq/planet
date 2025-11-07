pub fn bar(none) i32;

pub fn main(none) i32 {
    #  Two local declarations of foo in 'main' and 'bar' conflict -
    #      * different numbers of parameters
    #      
    fn foo(a: i32) i32;
    return bar() + foo(true)
}

pub fn bar(none) i32 {
    fn foo(a: i32, b: i32) i32;
    return foo(1, 2)
}
