#  It's illegal to use pointer as right operand in bitshift
pub fn main(none) i32 {
    ptr: *i32 = 0
    i: i32 = 1000
    i >> ptr
    return nil
}
