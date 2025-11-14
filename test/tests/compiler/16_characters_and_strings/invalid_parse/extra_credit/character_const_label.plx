# You can't use a character constant as a label
pub fn main(none) i32 {
    label 'x'
    return 0
}
