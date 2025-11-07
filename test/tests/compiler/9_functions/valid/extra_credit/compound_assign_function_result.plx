pub fn foo(none) i32 {
    return 2
}

pub fn main(none) i32 {
    x: i32 = 3
    x -= foo()
    return x
}
