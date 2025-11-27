#  In most of our test cases, the dead store we remove is a Copy.
#  * This test case validates that we can remove dead
#  * Binary and Unary instructions too.
#  * 





pub a: i32 = 1
pub b: i32 = 2

pub fn target(none) i32 {
    #  everything except the Return instruction should be optimized away.
    unused: i32 = a * -b
    return 5
}

pub fn main(none) i32 {
    return target()
}
