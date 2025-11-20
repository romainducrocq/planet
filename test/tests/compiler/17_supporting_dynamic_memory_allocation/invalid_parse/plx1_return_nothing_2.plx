x: i32 = 1

pub fn foo(none) none {
    x = x - 1
    return;
}

pub fn main(none) i32 {
    foo()
    return x
}
