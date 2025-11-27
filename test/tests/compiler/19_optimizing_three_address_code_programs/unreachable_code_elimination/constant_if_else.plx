#  Test that we eliminate an unreachable 'if' statement body.
#  * This also tests that we won't eliminate a block if some, but not all,
#  * of its precedessors are unreachable. The final 'return' statement's
#  * predecessors include the 'if' branch (which is dead) and the 'else'
#  * statement (which isn't).
#  * 
pub fn callee(none) i32 {
    return 0
}

pub fn target(none) i32 {
    x: i32;
    if 0 {
        x = callee()
    }
    else {
        x = 40
    }
    return x + 5
}

pub fn main(none) i32 {
    return target()
}
