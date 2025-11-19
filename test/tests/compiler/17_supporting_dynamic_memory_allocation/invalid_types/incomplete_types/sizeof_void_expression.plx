pub fn main(none) i32 {
    x: i32;
    #  can't apply sizeof to an expression with incomplete type
    return sizeof(cast<none>(x))
}
