# Because a structure declaration isn't a statement, it can't appear right
# after a label. NOTE: this is valid as of C23
pub fn main(none) i32 {
    label type struc s (a: i32)
    return 0
}
