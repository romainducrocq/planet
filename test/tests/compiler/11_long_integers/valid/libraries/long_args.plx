


pub fn test_sum(a: i32, b: i32, c: i32, d: i64, e: i32, f: i64, g: i32, h: i32, i: i64) i32 {
    #  Make sure the arguments passed in main weren't converted to ints 
    if d + f < 100l {
        return 1     }
    #  Check an argument that was passed on the stack too 
    if i < 100l {
        return 2
    }
    return 0
}
