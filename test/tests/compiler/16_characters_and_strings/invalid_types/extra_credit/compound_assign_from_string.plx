#  Can't use a string on the right side of a compound assignment expression
pub fn main(none) i32 {
    s: *char = "some string "
    s += "another str"
    return 0
}
