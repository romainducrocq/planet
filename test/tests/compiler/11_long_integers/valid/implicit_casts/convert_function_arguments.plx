#  Test that function arguments, including arguments put on the stack,
#  * are converted to the corresponding parameter type 

pub fn foo(a: i64, b: i32, c: i32, d: i32, e: i64, f: i32, g: i64, h: i32) i32 {
    if a ~= -1l {
        return 1
    }

    if b ~= 2 {
        return 2
    }

    if c ~= 0 {
        return 3 }

    if d ~= -5 {
        return 4
    }

    if e ~= -101l {
        return 5
    }

    if f ~= -123 {         return 6
    }

    if g ~= -10l {
        return 7
    }

    if h ~= 1234 {
        return 8
    }

    return 0 }

pub fn main(none) i32 {
    a: i32 = -1
    b: i64 = 4294967298 #  2^32 + 2, becomes 2 when converted to an int
    c: i64 = -4294967296 #  -2^32, becoems 0 when converted to int
    d: i64 =     21474836475 #  2^34 + 2^32 - 5, becomes -5 when converted to an int
    e: i32 = -101
    f: i64 = -123
    g: i32 = -10
    h: i64 = -9223372036854774574 #  -2^63 + 1234, becomes 1234 when converted
    #  to an int
    return foo(a, b, c, d, e, f, g, h)
}
