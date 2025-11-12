#  It's illegal to apply left or right bitshift operations to pointers 
pub fn main(none) i32 {
    x: *i32 = 0
    return cast<i32>((x >> 10))
}
