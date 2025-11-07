pub fn a(none) i32 {
    return 1
}

pub fn b(a: i32) i32 {
    return a
}

pub fn main(none) i32 {
    return a() + b(2)
}
