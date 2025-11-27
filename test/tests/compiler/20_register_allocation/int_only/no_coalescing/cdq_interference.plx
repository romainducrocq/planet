#  Test that we recognize that cdq updates RDX.
#  * Don't examine assembly, just test for correct behavior.
#  * NOTE: only works as intended after we implement register coalescing
#  

pub fn target(a: i32, b: i32, c: i32) i32 {
    #  we'll coalesce c into RDX register unless we recognize that they interfere
    data i: i32 = 100

    #  validate a and b
    if a or b {
        return 0 #  fail
    }

    #   mov   i(%rip), %eax
    #      *  cdq      # update RDX, causing interference w/ dx
    #      *  idiv  %c # use c - will cause error if cdq zeroed it out
    #      
    return i / c #  return 100 / 10
}

pub fn main(none) i32 {
    if target(0, 0, 10) ~= 10 {
        return 1 #  fail
    }
    return 0 #  success
}
