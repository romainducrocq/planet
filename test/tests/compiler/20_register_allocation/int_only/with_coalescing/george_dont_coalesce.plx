#  Test that we don't coalesce a pseudo into a hardreg if they fail the George
#  * and Briggs tests - specifically when they're connected by a mov of the form
#  * movl %hardreg, %pseudo. (For the equivalent test with movl %pseudo, %hardreg,
#  * see george_dont_coalesce_2.c) Coalescing registers that fail the George test
#  * here would force us to spill; we inspect the assembly for target to make
#  * sure there are no spills.
#  * 

import `../util`

pub glob: i32 = 1

#  a-f have values 1-6
pub fn target(a: i32, b: i32, c: i32, d: bool, e: i32, f: i32) bool {
    #  a-f interfere with g-l, g-l interfere wih m-q, and m-q interfere with
    #  all the param-passing registers. The only way to avoid spills is to put
    #  at least five of a-f in non-param-passing registers, so we can put at
    #  least five of pseudos g-l in param-passing registers, leaving five
    #  non-param-passing registers available for m-q. This means we can't
    #  coalesce all of a-f into parameter-passing registers.

    #  define g-l (values 7-12)
    g: i32 = a + f #  7
    h: i32 = b * d #  8
    i: i32 = c * c #  9
    j: i32 = d + f #  10
    k: i32 = e + f #  11
    l: i32 = f * b #  12

    #  define m-q; use a-f in initializer for m to make them interfere with g-l
    m: i32 = (a + b + c + d + e + f) - 7 #  14
    n: i32 = g + h #  15
    o: i32 = i + 7 #  16
    p: i32 = j * 2 - 3 #  17
    q: i32 = k + g #  18
    #  this makes m-q conflict w/ all param-passing registers
    check_12_ints(g, h, i, j, k, l, 13, m, n, o, p, q, 7)
    return 0
}

