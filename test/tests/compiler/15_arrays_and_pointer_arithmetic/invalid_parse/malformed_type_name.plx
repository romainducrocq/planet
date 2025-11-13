pub fn main(none) i32 {
    a: i32 = 4
    foo: *i32 = @a
    # invalid cast syntax; missing type specifier
    bar: [3]*i32 = cast<[3]*>(foo)
    return 0
}
