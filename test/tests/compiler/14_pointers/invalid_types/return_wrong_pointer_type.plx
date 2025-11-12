#  It's illegal to return an int *
#  * from a function with return type long *
#  * because you can't implicitly convert
#  * one pointer type to another
#  
pub i: i32;

pub fn return_long_pointer(none) *i64 {
    return @i
}

pub fn main(none) i32 {
    l: *i64 = return_long_pointer()
    return nil
}
