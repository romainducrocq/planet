#  It's illegal to multiply, divide, or take the modulo of pointers 
pub fn main(none) i32 {
    x: *i32 = 0
    y: *i32 = x
    (x * y)
    return 0
}
