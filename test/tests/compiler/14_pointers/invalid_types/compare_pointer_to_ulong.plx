#  It's illegal to compare a pointer to a value with a different type 
pub fn main(none) i32 {
    ptr: *i32 = 0ul #  Initializing a pointer with a null constant is allowed
    ul: u64 = 0ul
    return ptr == ul
}
