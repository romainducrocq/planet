#  Test that we don't choke on a program where final instruction is a jump.
#  * Note that last instruction will only be a jump on second iteration through
#  * the pipeline, after we've removed the extra Return instruction.
#  * We don't inspect the assembly for this program, we just make its behavior
#  * is correct, so the function under test is 'f' instead of 'target'
#  * 

pub fn f(a: i32) i32 {
    loop .. while 1 {
        a = a - true
        if a {
            return 17
        }
    }
}

pub fn main(none) i32 {
    return f(10)
}
