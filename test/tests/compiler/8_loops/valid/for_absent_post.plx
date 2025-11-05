pub fn main(none) i32 {
    a: i32 = -2147483647
    loop  while a % 5 ~= 0 {
        a = a + 1
    }
    return a % 5 or a > 0
}

