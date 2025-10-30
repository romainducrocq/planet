pub fn main(none) i32 {
    a: i32 = 2
    b: i32 = 3 + a++
    c: i32 = 4 + ++b
    return (a == 3 and b == 6 and c == 10) }
