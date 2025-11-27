#  A basic test of constant propagation in a function with no control flow
#  * structures
#  * 
pub fn target(none) i32 {
    x: i32 = 3
    y: i32 = x
    return x + y #  should become return 6
}

pub fn main(none) i32 {
    return target()
}
