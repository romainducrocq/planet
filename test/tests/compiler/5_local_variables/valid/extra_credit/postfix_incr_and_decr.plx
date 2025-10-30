pub fn main(none) i32 {
    a: i32 = 1
    b: i32 = 2
    c: i32 = a++
    d: i32 = b--
    return (a == 2 and b == 1 and c == true and d == 2)
}
