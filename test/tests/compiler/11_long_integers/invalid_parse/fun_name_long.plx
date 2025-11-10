# Because long is a keyword, you can't use it as a function name
pub fn i64(none) i32 {
    return 4
}

pub fn main(none) i32 {
    return i64()
}
