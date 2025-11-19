#  This is similar to chapter_9/valid/stack_arguments/test_for_memory_leaks.c
#  * except that it calls a void function; make sure we restore stack frame correctly
#  * after a void function call
#  * 

extrn sum: i64;
pub fn lots_of_args(a: i32, b: i32, c: i32, d: i32, e: i32, f: i32, g: i32, h: i32, i: i32, j
    : i32, 
    k: i32, l
    : i32, m: i32, n: i32, o: bool) none;

pub fn main(none) i32 {
    #  call lots_of_args many times; if we aren't deallocating arguments and padding correctly, it will segfault
    loop i: i32 = 0 while i < 10000000 .. i = i + 1 {
        lots_of_args(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, i)
    }
    if sum ~= 49999995000000 {
        return 15
    }
    return 0
}
