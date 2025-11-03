pub fn main(none) i32 {
    x: i32 = 0
    y: i32 = 2
    if y -= ? x += 4 then x /= 2 else x = 10 {
        x = 20
    }
    return ? x++ == 2 and y++ then ++x else --y
}
