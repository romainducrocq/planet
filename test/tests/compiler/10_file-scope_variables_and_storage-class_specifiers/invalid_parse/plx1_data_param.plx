# A function parameter cannot have a storage class
pub fn f(i: i32, data j: i32) i32 {
    return i == j
}

pub fn main(none) i32 {
    return f(1, 2)
}
