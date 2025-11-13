pub fn main(none) i32 {
    # invalid declarator syntax: can't have parenthesized (*) in non-abstract declarator
    ptr_to_array: *i32[3] = 0
    return 0
}
