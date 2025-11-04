pub fn main(none) i32 {
    a: i32 = 2
    b: i32;
    {
        a = -4
        a: i32 = 7
        b = a + 1
    }
    return b == 8 and a == -4
}
