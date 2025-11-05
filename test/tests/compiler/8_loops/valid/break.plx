pub fn main(none) i32 {
    a: i32 = 10
    b: i32 = 20
    loop b = -20 while b < 0 .. b = b + 1 {
        a = a - 1
        if a <= 0 {
            break
        }
    }

    return a == 0 and b == -11
}

