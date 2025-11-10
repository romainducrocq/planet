pub fn add_variables(x: i64, y: i64, z: bool) i64;

pub fn main(none) i32 {
    #  Allocate several stack variables of different sizes;
    #      * in our implementation, this will allocate 20 bytes on the stack 
    x: i64 = 3
    y: i64 = 4
    z: i32 = 5

    #  Test that we can make function calls (i.e. that stack is aligned correctly) 
    return add_variables(x, y, z)
}
