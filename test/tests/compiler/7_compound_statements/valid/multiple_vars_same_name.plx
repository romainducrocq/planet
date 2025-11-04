pub fn main(none) i32 {
    a: i32 = 0
    {
        b: i32 = 4
        a = b
    }
    {
        b: i32 = 2
        a = a - b
    }
    return a
}
