pub fn main(none) i32 {
    x: *i32 = 0
    #  you can't subtract a pointer from an integer
    #  Note that 0 is NOT implicitly converted to a null pointer here
    return false - x == false
}
