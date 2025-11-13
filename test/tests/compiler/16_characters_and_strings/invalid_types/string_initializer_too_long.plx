#  You can't initialize a char array from a string literal
#  * that's too long to fit in it 
pub fn main(none) i32 {
    too_long: [3]char = "abcd"
    return 0
}
