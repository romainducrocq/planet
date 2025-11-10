#  This is identical to the test case in tests/chapter11/valid/long_expressions/return_long.c,
#  * but split across multiple files.
#  

pub fn add(a: i32, b: i32) i64;

pub fn main(none) i32 {
    a: i64 = add(2147483645, 2147483645)
    #  Test returning a long from a function call 
    if a ~= 4294967290l {
        return 1
    }
    return 0 #  success
}
