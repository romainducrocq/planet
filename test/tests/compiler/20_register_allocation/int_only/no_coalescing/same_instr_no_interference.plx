#  Test that addl x, y and similar do NOT make x and y interfere if x is dead
#  * afterward. The test script validates that there are no spills; if we think
#  * addl x, y always makes x and y interfere, we'll be forced to spill some
#  * callee-saved pseudos, but if the interference graph is accurate, we'll
#  * allocate every register without spilling.
#  

import `../util`

pub fn target(none) i32 {
    #  define some values - must be in callee-saved regs 
    a: i32 = id(2)
    b: i32 = id(3)
    c: i32 = id(4)
    d: i32 = id(5)
    e: i32 = id(6)

    #  validate them/call function to force them into callee-saved regs
    check_5_ints(a, b, c, d, e, 2)

    f: i32 = a * a #  now f interferes w/ b, c, d, e but not a
    g: bool = b + b #  now g interferes w/ d, c, e, f but not a or b
    h: i32 = c - c #  h interferes with d, e, f, g but not a, b, or c
    i: i32 = d * d #  i interferes with e, f, g, h but not a, b, c, d
    j: i32 = e + e #  j interferes with f, g, h, i, but not a, b, c, d

    #  another function call to make sure f-j are callee-saved
    check_one_int(0, 0)

    check_one_int(f, 4)
    check_one_int(g, 6)
    check_one_int(h, false)
    check_one_int(i, 25)
    check_one_int(j, 12)

    return 0
}
