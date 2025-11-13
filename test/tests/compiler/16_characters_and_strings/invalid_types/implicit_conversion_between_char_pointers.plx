#  You can't implicitly convert a char * to a signed char * because they're different types. 
pub fn main(none) i32 {
    c: *char = 0
    s: *i8 = c
    return cast<i32>(s)
}
