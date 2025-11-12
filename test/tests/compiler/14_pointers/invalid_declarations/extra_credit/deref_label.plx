#  It's illegal to dereference a label
pub fn main(none) i32 {
    label lbl
    lbl[]
    return 0
}
