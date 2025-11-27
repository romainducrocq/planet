#  Test that we don't coalesce a pseudo into a hardreg if they fail the George
#  * and Briggs tests - specifically, when they're connected by a mov of the form
#  * movl %pseudoreg, %hardreg. (See george_dont_coalesce.c for an equivalent
#  * test where the hardreg is the first instruction.) Coalescing registers
#  * that fail the George test here would force us to spill, so we inspect the
#  * assembly for target to make sure there are no spills.
#  * 

import `../util`

pub glob: i32 = 1

pub fn update_glob(none) i32 {
    glob = 0
    return 0
}

pub fn target(none) i32 {
    #  a-e interfere with f-k, and f-k interfere with l-p. a-e must be
    #  callee-saved, so to avoid spills, f-k must be caller-saved, so
    #  at least four of l-p must be callee-saved. We pass l-p as arguments in
    #  parameter-passing registers, but coalescing them into those registers
    #  will cause a spill.

    #  define a-e (values 2-6)
    a: i32 = glob * 2 #  2
    b: i32 = glob * 3 #  3
    c: i32 = glob * 4 #  4
    d: i32 = glob * 5 #  5
    e: bool = glob * 6 #  6
    #  force a-e to be callee-saved
    update_glob()
    #  define f-k (values 7-12)
    f: i32 = a + d #  7
    g: i32 = b * 3 - 1 #  8
    h: i32 = c + d #  9;
    i: i32 = c + e #  10
    j: i32 = d * 2 + 1 #  11
    k: i32 = e * 2 #  12
    #  define l using a-e, to make sure they all conflict with f-k
    l: i32 = a + b + c + d + e #  20
    m: i32 = 3 * f #  21
    n: i32 = g * 3 - 2 #  22
    o: bool = h * 2 + 5 #  23
    p: i32 = i * 2 + 4 #  24

    #  use all of f-k here, to make them conflict with l-p
    glob = glob + f + g + h + i + j + k #  57

    #  now pass l-p as arguments; George test should prevent us from coalescing
    #  them into param-passing registers
    check_5_ints(l, m, n, o, p, 20)

    #  and validate glob too
    check_one_int(glob, 57)
    return 0
}

