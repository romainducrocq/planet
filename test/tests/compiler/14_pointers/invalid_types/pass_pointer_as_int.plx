#  It's illegal to pass a pointer as a function argument
#  * where an integer is expected, beause you can't implicitly
#  * convert a pointer to an integer type
#  
pub fn f(i: i32) i32 {
    return i
}

pub fn main(none) bool {
    x: i32;
    return f(@x)
}
