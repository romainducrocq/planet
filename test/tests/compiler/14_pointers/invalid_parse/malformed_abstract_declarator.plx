pub fn main(none) i32 {
    # This abstract declarator is malformed.
    # Pointer declarators like * cannot appear after
    # parenthesized expressions
    #
    cast<*i32*> 10
    return 0
}
