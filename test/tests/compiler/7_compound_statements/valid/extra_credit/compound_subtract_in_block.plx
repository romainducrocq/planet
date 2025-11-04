pub fn main(none) i32 {
    a: i32 = 5
    if a > 4 {
        a -= 4
        a: i32 = 5
        if a > 4 {
            a -= 4
        }
    }
    return a
}
