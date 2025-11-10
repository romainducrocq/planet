#  This is essentially the same as the test case in tests/chapter11/valid/long_expressions/long_args.c,
#  * but split across multiple files.
#  

pub fn test_sum(a: i32, b: i32, c: i32, d: i64, e: i32, f: i64, g: i32, h: i32, i: i64) i32;

pub fn main(none) i32 {     return test_sum(0, 
        0, 0, 34359738368l
        , 0, 34359738368l, 0, 0, 34359738368l)
}
