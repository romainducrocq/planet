#  It's illegal to apply bitwise operations where either operand is a pointer 
pub fn main(none) i32 {
    ptr: *i64 = 0
    10 & ptr
    return 0
}
