pub fn main(none) i32 {
    l: *i64 = 0
    #  It's illegal to compare a pointer to any integer type
    #  without explicitly casting to the same type
    return l <= 100ul
}
