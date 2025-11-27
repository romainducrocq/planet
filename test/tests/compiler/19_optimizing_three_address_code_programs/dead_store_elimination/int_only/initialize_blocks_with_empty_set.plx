#  Test that we initialize each block in the CFG with an empty set of
#  * live variables. Specifically, this test will fail if each block is
#  * initialized with the set of all static variables.
#  





pub j: i32 = 3
pub fn target(none) i32 {
    data i: i32;
    i = 10 #  dead store, b/c i is killed on path to exit
    #  but if we initially think i is live at the start of the
    #  while loop, our analysis will never figure out that it's dead
    #  here
    loop while j > 0 {
        j = j - 1
    }
    i = nil
    return 0
}

pub fn main(none) i32 {
    target()
    return (j == 0) #  just make sure target() actually did something
}
