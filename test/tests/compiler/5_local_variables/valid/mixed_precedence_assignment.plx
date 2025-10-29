pub fn main(none) i32 {
    a: i32 = 1
    b: i32 = 0
    a = 3 * (b = a)
    return a + b
}
