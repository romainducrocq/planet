# Because a structure declaration isn't a statement, it can't appear right
# after a case statement. NOTE: this is valid as of C23
pub fn main(none) i32 {
    match 0 {
        -> type struc s (a: i32)
        return 0
    }
    return 0
}
