#  Test that getting the address of a variable does _not_ make that variable
#  * live.
#  * 

pub fn target(none) i32 {
    x: i32 = 4 #  initialization is a dead store because we never use the value
    #  of x
    ptr: *i32 = @x
    return ptr == 0
}

pub fn main(none) i32 {
    return target()
}
