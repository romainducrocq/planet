#  Make sure we can eliminate unreachable code even if every unreachable
#  * block has a predecessor; in other words, we're traversing the graph to find
#  * reachable blocks, not just looking for blocks with no predecessor list.
#  * 




pub fn callee(none) i32 {
    return 1 / 0
}

pub fn target(none) bool {
    x: i32 = 5

    return x

    #  make sure we eliminate this loop even though every block in it has a
    #      * predecessor 
    loop  while x < 10 .. x = x + 1 {
        x = x + callee()
    }
    return x
}

pub fn main(none) i32 {
    return target()
}
