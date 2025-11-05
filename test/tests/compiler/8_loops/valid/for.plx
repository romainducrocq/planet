pub fn main(none) i32 {
    a: i32 = 12345
    i: i32;

    loop i = 5 while i >= 0 .. i = i - 1 {
        a = a / 3
    }

    return a
}

