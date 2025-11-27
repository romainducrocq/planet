#  Test that we eliminate the second clause in 1 || x 
pub fn putchar(c: i32) i32;

pub fn target(none) i32 {
    return true or putchar(97)
}

pub fn main(none) i32 {
    return target()
}
