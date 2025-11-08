pub a: i32 = 10
#  b has static storage duration,
#  * so its initializer must be constant.
#  
pub b: i32 = 1 + a

pub fn main(none) i32 {
    return b
}
