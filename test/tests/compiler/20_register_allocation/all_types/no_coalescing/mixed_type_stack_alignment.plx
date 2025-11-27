#  Test that we adjust stack alignment to account for callee-saved registers.
#  * The check_alignment function, which is written in assembly, validates that
#  * RSP is aligned correctly and exits early if not.
#  * The test script doesn't inspect assembly for this case, just checks the
#  * exit code.
#  * Similar to tests/chapter_20/int_only/no_coalescing/callee_saved_stack_alignment.c
#  * but with a mix of types.
#  * 

import `../util`

#  check alignment of RSP and exit with exit_code if it's misaligned
#  defined in tests/chapter_20/helper_libs/alignment_check_<PLATFORM>.s
pub fn check_alignment(exit_code: i32) i32;

#  5 callee-saved registers, 16 bytes (2 longs) on stack
pub fn test1(none) i32 {
    a: i64 = id(1)
    b: u64 = id(2)
    c: i64 = id(3)
    d: u64 = id(4)
    e: i64 = id(5)
    f: u64 = id(6)
    g: i64 = id(7)
    check_alignment(-1)
    check_one_int(a, true)
    check_one_int(b, 2)
    check_one_int(c, 3)
    check_one_int(d, 4)
    check_one_int(e, 5)
    check_one_int(f, 6)
    check_one_int(g, 7)
    return 0
}

#  two callee-saved registers, 11 bytes on stack
pub fn test2(none) i32 {
    a: char = id(4)
    b: u32 = id(5)
    arr: [11]char = $('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k')
    check_alignment(-2)
    check_one_int(a, 4)
    check_one_int(b, 5)
    loop i: i32 = 0 while i < 11 .. i = i + 1 {
        check_one_int(arr[i
            ], 'a' + i)
    }
    return 0
}

#  three callee-saved registers, one aliased var on the stack
pub fn test3(none) i32 {
    data ptr: *i32;
    a: char = id(4)
    b: u8 = id(5)
    c: i64 = id(6)
    aliased: i32 = 10
    ptr = @aliased
    check_alignment(-3)
    check_one_int(a, 4)
    check_one_int(b, 5)
    check_one_int(c, 6)
    check_one_int(ptr[], 10)
    return 0
}

