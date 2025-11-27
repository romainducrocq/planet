#  Test that we don't coalesce two pseudos that fail the Briggs test. In this
#  * case, coalescing two candidates that are connected by a mov instruction would
#  * cause a spill, so we inspect the assembly for the target function to make
#  * sure there are no spills.
#  * 

import `../util`

pub glob: i32 = 5

pub fn update_glob(none) bool {
    glob = glob + 1
    return 0
}

pub fn target(none) bool {
    #  NOTE: parts of this are copy pasted from loop.c, which creates a similar
    #  interference graph
    z: i32 = glob + 10
    a: i32;

    #  define four callee-saved regs
    one: i32 = glob - 4
    two: i32 = glob / 2
    three: i32 = -glob + 8
    four: i32 = glob - true

    update_glob() #  make one-four and z callee-saved

    if glob {
        #  a and z are both callee-saved but their live ranges don't overlap;
        #  we can avoid spills by placing them in the same hard register
        #  this becomes:
        #  movl $1, %tmp
        #  subl %z, %tmp
        #  movl %tmp, %a
        #  so a and z don't interfere, but they will if we coalesce tmp and a.
        #  Briggs test should prevent them from being coalesced.
        #  we put this in an if statement to prevent copy prop of 1-z
        a = 1 - z
    }
    else {
        a = 5
    }


    #  validate callee-saved regs
    check_one_int(one, 1)
    check_one_int(two, 2)
    check_one_int(three, 3)
    check_one_int(four, 4)

    #  validate a
    check_one_int(a, -14)

    #  validate glob
    check_one_int(glob, 6)
    return 0
}
