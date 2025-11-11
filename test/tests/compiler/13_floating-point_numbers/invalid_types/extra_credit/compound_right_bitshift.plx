pub fn main(none) i32 {
    #  Can't perform compound bitwise operations with doubles
    i: i32 = 1000
    i >>= 2.0
    return i
}
