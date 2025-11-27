#  Test that we eliminate code that goto jumps over 
pub fn callee(none) i32 {
    return 1
}

pub fn target(none) i32 {
    x: bool = 10
    jump end
    x = callee() #  eliminate this
    label end
    return x
}

pub fn main(none) i32 {
    return target()
}
