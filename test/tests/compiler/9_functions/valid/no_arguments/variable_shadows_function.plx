pub fn main(none) i32 {
    fn foo(none) i32;

    x: i32 = foo()
    if x > 0 {
        foo: i32 = 3
        x = x + foo
    }
    return x
}

pub fn foo(none) i32 {
    return 4
}
