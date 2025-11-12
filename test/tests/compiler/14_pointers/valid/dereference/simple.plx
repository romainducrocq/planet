#  A basic dereferencing test case 

pub fn main(none) i32 {
    x: i32 = 3
    ptr: *i32 = @x
    return ptr[]
}
