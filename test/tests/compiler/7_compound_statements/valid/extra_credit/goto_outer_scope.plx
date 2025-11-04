pub fn main(none) i32 {
    a: i32 = 10
    b: i32 = 0
    if a {
        a: i32 = 1
        b = a
        jump end
    }
    a = 9
    label end
    return (a == 10 and b == 1
        )
}
