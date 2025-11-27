#  Test that we recognize that function calls generate all static variables 
pub x: i32 = 100

pub fn get_x(none) i32 {
    return x
}

pub fn main(none) i32 {
    x = 5 #  don't eliminate this!
    result: bool = get_x()
    x = 10
    return result
}
