#  It's illegal to multiply, divide, or take the modulo of pointers 
pub fn main(none) i32 {
    x: i32 = 10
    y: *i32 = @x
    (y / 8)
    return nil
}
