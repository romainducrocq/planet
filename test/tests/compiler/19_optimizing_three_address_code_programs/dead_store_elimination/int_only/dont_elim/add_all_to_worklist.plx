#  Make sure we add every basic block to the worklist
#  * at the start of the iterative algorithm
#  
pub fn putchar(c: i32) i32;

pub fn f(arg: i32) i32 {
    x: i32 = 76
    if arg < 10 {
        #  give x multiple values on different paths
        #  so we can't propagate it
        x = 77
    }
    #  no live variables flow into this basic block from its successor,
    #  bu we still need to process it to learn that x is live
    if arg {
        putchar(x)
    }
    return 0
}

pub fn main(none) i32 {
    f(0)
    f(1)
    f(11)
    return 0
}
