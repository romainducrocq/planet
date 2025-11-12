#  It's illegal to compare two different pointer types 
pub fn main(none) i32 {
    x: *i32 = 0ul
    y: *u32 = 0ul
    return x == y
}
