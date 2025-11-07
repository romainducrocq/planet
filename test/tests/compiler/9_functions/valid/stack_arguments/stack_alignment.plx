#  Call functions with both even and odd numbers of stack arguments,
#  * to make sure the stack is correctly aligned in both cases.
#  

#  these are defined in stack_alignment_check_<platform>.s
#  and exit with value -1 if RSP is misaligned or arguments
#  don't have the expected values
pub fn even_arguments(a: i32, b: i32, c: i32, d: i32, e: i32, f: i32, g: i32, h: i32) i32;

pub fn odd_arguments(a: i32, b: i32, c: i32, d: 
    i32, e: 
    i32, f: i32, 
    g: i32, h: i32, i: i32) i32;

pub fn main(none) i32 {
    #  Allocate an argument on the stack, to check that
    #      * we properly account for already-allocated stack space
    #      * when deciding how much padding to add
    #      
    x: i32 = 3
    #  call some functions, check stack alignment
    even_arguments(1, 2, 3, 4, 5, 6, 7, 8)
    odd_arguments(1, 2, 3, 4, 5, 6, 7, 8, 9)
    #  return x to make sure it hasn't been clobbered
    return x
}
