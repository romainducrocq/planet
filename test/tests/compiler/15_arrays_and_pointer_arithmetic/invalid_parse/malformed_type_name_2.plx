pub fn main(none) i32 {
    ptr: *i32;
    # this is malformed in two ways: the declarator itself is invalid,
    # and it's missing a type specifier
    array_pointer: *[3]i32 = cast<[3]*>(ptr)
    return 0
}
