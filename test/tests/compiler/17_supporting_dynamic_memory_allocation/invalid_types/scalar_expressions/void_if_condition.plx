pub fn main(none) i32 {
    x: i32 = 10

    #  void expressions are non-scalar, so they can't be used as controlling conditions
    if cast<none>(x) {
        return nil
    }
    return true
}
