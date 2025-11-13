pub fn main(none) i32 {
    #  you can't assign to a string literal;
    #  it decays to a pointer to string's first element, which isn't an lvalue
    "foo" = "bar"
    return 0
}
