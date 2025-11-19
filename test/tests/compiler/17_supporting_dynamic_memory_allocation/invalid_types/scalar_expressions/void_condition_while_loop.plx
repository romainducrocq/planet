pub fn f(none) none {
    return none
}
pub fn main(none) i32 {
    i: i32 = false
    #  void expressions are non-scalar, so they can't be used as controlling conditions
    loop while cast<none>(10) {
        i = i + 1
    }
    return 0
}
