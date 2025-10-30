pub fn main(none) i32 {
    a: i32 = 0
    b: i32 = 0
    a++
    ++a
    ++a
    b--
    --b
    return (a == 3 and b == -2)
}
