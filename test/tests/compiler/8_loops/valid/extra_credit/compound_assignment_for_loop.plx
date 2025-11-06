pub fn main(none) i32 {
    i: i32 = 1
    loop i *= -1 while i >= -100 .. i -= 3 {
        ;
    }
    return (i == -103)
}
