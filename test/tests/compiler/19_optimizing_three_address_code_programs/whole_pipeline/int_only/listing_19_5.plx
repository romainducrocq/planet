#  Test case that produces TACKY similar to Listing 19-5;
#  * this should be optimized to a single "Return 9" instruction 

#  make flag a global variable rather than a parameter
#  so we don't have any instructions setting up function parameters,
#  e.g. movl %edi, -4(%rbp), which the test script will complain about
pub flag: i32 = 1

pub fn target(none) i32 {
    x: i32 = 4
    z: i32;
    if 4 - x {
        x = 3
    }
    if not flag {
        z = 10
    }
    z = x + 5
    return z
}

pub fn main(none) i32 {
    return target()
}
