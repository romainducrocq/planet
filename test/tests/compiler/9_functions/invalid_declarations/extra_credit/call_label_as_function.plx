pub fn main(none) i32 {
    x: i32 = 1
    label a
    x = x + 1
    a() #  can't call a label like a function
    return x

}
