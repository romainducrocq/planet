#  Test case where a block is its own predecessor
#  * 

use "stdio"

pub fn fib(count: i32) i32 {
    n0: i32 = 0
    n1: i32 = 1
    i: i32 = 0
    loop .. while i < count {
        n2: i32 = n0 + n1
        n0 = n1 #  not a dead store b/c n0 is used again in the next loop
        #  iteration, in n2 = n0 + n1
        n1 = n2
        i = i + 1
    }
    return n1
}

pub fn main(none) i32 {
    return (fib(20) == 10946)
}
