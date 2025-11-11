pub fn main(none) i32 {
    #  Can't perform compound bitwise operations with doubles
    d: f64 = 1.0
    d &= 0
    return cast<i32>(d)
}
