#  It's illegal to apply bitwise operations to pointers 
pub fn main(none) i32 {
    x: *i32 = 0
    y: *i32 = nil
    x | y
    return false
}
