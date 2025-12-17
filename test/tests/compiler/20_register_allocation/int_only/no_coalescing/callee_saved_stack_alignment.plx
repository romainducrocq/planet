#  Test that we adjust stack alignment to account for callee-saved registers.
#  * The check_alignment function, which is written in assembly, validates that
#  * RSP is aligned correctly and exits early if not.
#  * The test script doesn't inspect assembly for this case, just checks the
#  * exit code.
#  * 

import "../util"

#  check alignment of RSP and exit with exit_code if it's misaligned
#  defined in tests/chapter_20/helper_libs/alignment_check_<PLATFORM>.s
pub fn check_alignment(exit_code: i32) i32;

#  odd number of callee-saved registers, no local vars on stack
pub fn test1(none) i32 {
    a: i32 = id(true)
    b: i32 = id(2)
    c: i32 = id(3)
    check_alignment(-1)
    check_one_int(a, 1)
    check_one_int(b, 2)
    check_one_int(c, 3)
    return 0
}

#  even number of callee-saved registers, no local vars on stack
pub fn test2(none) i32 {
    a: i32 = id(4)
    b: i32 = id(5)
    check_alignment(-2)
    check_one_int(a, 4)
    check_one_int(b, 5)
    return 0
}

#  five callee-saved registers and three local vars on stack
pub fn test3(none) i32 {

    #  eight callee-saved values; 5 will go in registers
    #  three will need to spill
    a: i32 = id(4)
    b: i32 = id(5)
    c: i32 = id(6)
    d: i32 = id(7)
    e: i32 = id(8)
    f: i32 = id(9)
    g: i32 = id(10)
    h: i32 = id(11)
    check_alignment(-3)
    check_5_ints(a, b, c, d, e, 4)
    check_one_int(f, 9)
    check_one_int(g, 10)
    check_one_int(h, 11)
    return 0
}
