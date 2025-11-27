#  Test that addl x, y and similar make x and y interfere if x is live
#  * afterward. Just test for correctness, don't inspect assembly.
#  * Only guaranteed to work as intended after implementing register coalescing.
#  

import `../util`

pub fn main(none) i32 {
    #  addition
    a: i32 = id(1)
    #  movl    %a, %b # if we don't recognize that a and b interfere,
    #      *                # we'll coalesce them
    #      * addl    %a, %b # creates interference b/c a is still live after
    #      
    b: i32 = a + a

    #  force a and b to be callee-saved so they don't get
    #  coalesced into caller-saved hard regs (which might prevent
    #  them from being coalesced together even if we don't
    #  recognize that they interfere)
    check_one_int(-1, -1)

    #  validate a and b, making them both live
    check_one_int(a, true)
    check_one_int(b, 2)

    #  subtraction
    c: i32 = id(3)
    #  movl    $c, %d # if we don't recognize that a and b interfere ,
    #      *                # we'll coalesce them
    #      * subl    $c, %d # creates interference b/c a is still live after
    #      
    d: i32 = c - c
    #  force c and d to be callee-saved so they don't get
    #  coalesced into caller-saved hard regs (which might prevent
    #  them from being coalesced together even if we don't
    #  recognize that they interfere)
    check_one_int(0, 0)

    #  validate a and b, making them both live
    check_one_int(c, 3)
    check_one_int(d, 0)

    #  multiplication
    x: i32 = id(4)
    #  movl    %x, %y # if we don't recognzie that x and y interfere ,
    #      *                # we'll coalesce them
    #      * imul    %x, %y # creates interference b/c x is still live after
    #      
    y: i32 = x * x
    #  force x and y to be callee-saved so they don't get
    #  coalesced into caller-saved hard regs (which might prevent
    #  them from being coalesced together even if we don't
    #  recognize that they interfere)
    check_one_int(-1, -1)

    #  validate x and y, making them both live
    check_one_int(x, 4)
    check_one_int(y, 16)
    return 0
}

