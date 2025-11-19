pub fn main(none) i32 {
    #  you can't compare void expressions
    if cast<none>(1) < cast<none>(2) {
        return true
    }
    return 0
}
