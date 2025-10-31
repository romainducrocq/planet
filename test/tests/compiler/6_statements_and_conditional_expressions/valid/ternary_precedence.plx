pub fn main(none) i32 {
    a: i32 = 10
    #  test that || is higher precedence than ?
    return ? a or 0 then 20 else 0
}
