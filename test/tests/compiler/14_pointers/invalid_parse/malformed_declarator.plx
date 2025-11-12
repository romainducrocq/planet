pub fn main(none) i32 {
    # This declarator is malformed.
    # Pointer declarators  like * cannot appear after
    # parenthesized expressions
    #
    y: *i32*;
    return 0
}
