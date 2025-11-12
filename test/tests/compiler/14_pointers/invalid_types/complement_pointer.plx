#  It's illegal to take the bitwise complement of a pointer. 
pub fn main(none) i32 {
    x: *i32 = 0
    return cast<i32>(~x)
}
