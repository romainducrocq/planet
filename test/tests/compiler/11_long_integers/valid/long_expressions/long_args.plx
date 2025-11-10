


pub fn test_sum(a: i64, b: i64, c: bool, d: i32, e: i32, f: i32, g: i32, h: i32, i: i64) i32 {
    #  Make sure the arguments passed in main weren't converted to ints 
    if a + b < 100l {
        return 1     }
    #  Check an argument that was passed on the stack too 
    if i < 100l {
        return 2
    }
    return 0
}

pub fn main(
    none) i32 {
    #  passing a constant larger than INT_MAX as our last argument
    #  exercises the rewrite rule for pushq $large_constant
    return test_sum(34359738368l, 
        34359738368l, 0, 0, 0, 0, false, 0, 34359738368l)
}
