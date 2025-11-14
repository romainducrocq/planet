# You can't use a string literal as a label in a goto statement
pub fn main(none) i32 {
    jump "foo"
    return 0
}
