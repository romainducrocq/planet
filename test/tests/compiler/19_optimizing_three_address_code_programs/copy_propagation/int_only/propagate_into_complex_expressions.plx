#  Test that we can propagate values from copies
#  * into unary expressions, binary expressions,
#  * and conditional jumps.
#  * 
pub fn target(none) i32 {
    x: i32 = 100
    y: i32 = -x * 3 + 300
    return (? y then x % 3 else x / 4)
}

pub fn main(none) i32 {
    return target() == 25
}
