# You can't use a character constant as a label in a goto statement
pub fn main(none) i32 {
    jump 'x'
    'x'
    return 0
}
