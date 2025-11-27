#  Test that we eliminate any code after a return statement. 
pub fn callee(none) i32 {
    return 1
}

pub fn target(none) i32 {
    return 2

    #  Everything past this point should be optimized away 
    x: bool = callee()

    if x {
        x = 10
    }

    y: i32 = callee()
    return x + y
}

pub fn main(none) i32 {
    return target()
}
