#  Test that we eliminate useless JumpIfZero and JumpIfNotZero instructions. 




pub fn target(a: i32) i32 {
    #  on second unreachable code elimination pass, this will include
    #  a JumpIfNotZero to its default successor (where we assign result = 1)
    x: i32 = a or 5

    #  on second unreachable code elimination pass, this will include
    #  a JumpIfZero to its default successor (where we assign result = 0)
    y: i32 = a and false
    return x + y
}

pub fn main(none) i32 {
    return target(10)
}
