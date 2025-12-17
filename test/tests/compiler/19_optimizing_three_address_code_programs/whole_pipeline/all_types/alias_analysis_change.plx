#  Test that we rerun alias analysis with each pipeline iteration 

use "stdio"

pub fn foo(ptr: *i32) i32 {
    putchar(ptr[])
    return 0
}

pub fn target(none) i32 {
    x: i32 = 10 #  this is a dead store
    y: i32 = 65
    ptr: *i32 = @y
    if 0 {
        #  on our first pass through the pipeline it will look like x is
        #  aliased; on later passes, after unreachable code elimination removes
        #  this branch, we'll recognize that x is not aliased
        ptr = @x
    }
    x = 5 #  this is a dead store, but we'll only recognize this after
    #  rerunning alias analysis
    foo(ptr) #  we'll think this makes x live until we recognize that x is not
    #  aliased

    return 0
}

pub fn main(none) i32 {
    return target()
}
