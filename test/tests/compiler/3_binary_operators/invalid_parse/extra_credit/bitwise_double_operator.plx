pub fn main(none) i32 {
    # we should lex this as two | operators, not a single || operator,
    # even after we add || in the next chapter
    return 1 | | 2
}
