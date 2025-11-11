pub fn main(none) i32 {
    #  Can't perform compound bitwise operations with doubles
    i: i32 = 0
    i |= 2.0
    return cast<i32>(i)
}
