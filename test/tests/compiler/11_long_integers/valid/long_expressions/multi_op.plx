pub fn target(a: i64) i32 {
    #  a = 4294967290l

    #  This expression produces an intermediate result that cannot
    #      * fit in an int, in order to test that we track the sizes
    #      * of intermediate results and allocate enough stack
    #      * space for them.
    #      
    b: i64 = a * 5l - 10l
    if b == 21474836440l {
        return 1
    }
    return 0
}

pub fn main(none) i32 {
    return target(4294967290l)
}
