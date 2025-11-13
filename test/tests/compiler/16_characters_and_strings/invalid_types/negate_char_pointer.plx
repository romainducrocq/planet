#  You can't negate pointers, including pointers to char 
pub fn main(none) i32 {
    x: *char = "foo"
    return -x
}
