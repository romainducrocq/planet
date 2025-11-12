#  It's illegal to apply bitwise operations where either operand is a pointer 
pub fn main(none) i32 {
    ptr: *u64 = 0
    l: i64 = 100
    ptr ^ l
    return 0
}
