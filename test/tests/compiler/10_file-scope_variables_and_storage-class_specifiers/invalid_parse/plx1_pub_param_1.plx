# A function parameter cannot have a storage class
pub fn f(pub i: i32) i32 {
    return i
}

pub fn main(none) i32 {
    return f(1)
}
