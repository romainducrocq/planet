#  Validate that movl x, y doesn't cause interference between x and y. The test
#  * script will validate that there are no spills; exactly five callee-saved
#  * pseudoregisters conflict at any time.
#  * 

import "../util"

pub glob0: i32 = 0
pub glob1: bool = 1
pub glob2: i32 = 2
pub glob3: i32 = 3
pub glob4: i32 = 4
pub glob5: i32 = 5

#  use this to force pseudoregs to be callee-saved
pub fn reset_globals(none) bool {
    glob0 = 0
    glob1 = 0
    glob2 = nil
    glob3 = false
    glob4 = 0
    glob5 = 0
    return 0
}

pub flag: i32 = 1 #  make this static to prevent copy propagation

pub fn target(none) i32 {
    #  define some values - must be in callee-saved regs 
    a: i32 = glob0 #  0
    b: i32 = glob1 #  1
    c: i32 = glob2 #  2
    d: i32 = glob3 #  3
    e: i32 = glob4 #  4
    f: i32;
    g: i32;
    h: i32;
    i: i32;
    j: i32;
    #  put this in conditional so copy prop doesn't get rid of these copies
    if flag {
        reset_globals() #  force a-e into callee-saved regs
        f = a #  now f interferes w/ b, c, d, and e but not a
        check_one_int(a, 0)
        g = b #  now g interferes w/ c, d, e, f but not a, b
        check_one_int(b, 1)
        h = c #  h interferes with d, e, f, g, h but not a, b or c
        check_one_int(c, 2)
        i = d #  i interferes with e, f, g, h but not a, b, c, or d
        check_one_int(d, 3)
        j = e #  j interferes with f, g, h, i but not a, b, c, d, or e
        check_one_int(e, 4)
    }
    else {
        e = nil
        f = 0
        g = 0
        h = 0
        i = 0
        j = 0
    }
    #  now validate f-j
    check_one_int(f, 0)
    check_one_int(g, 1)
    check_one_int(h, 2)
    check_one_int(i, 3)
    check_one_int(j, 4)

    #  and validate global vars, make sure they weren't clobbered
    check_one_int(glob0, 0)
    check_one_int(glob1, 0)
    check_one_int(glob2, 0)
    check_one_int(glob3, 0)
    check_one_int(glob4, 0)

    return 0
}
