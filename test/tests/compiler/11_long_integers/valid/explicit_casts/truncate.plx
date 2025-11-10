pub fn truncate(l: i64, expected: i32) i32 {
    result: i32 = cast<i32>(l)
    return (result == expected)
}

pub fn main(none) i32 {
    #  If a long is already in the range of 'int',
    #      * truncation doesn't change its value.
    #      
    if not truncate(10l, 10) {
        return 1
    }

    #  Truncating a negative int also preserves its value 
    if not truncate(-10l, -10) {
        return 2
    }
    #  If a long is outside the range of int,
    #      * subtract 2^32 until it's in range
    #      
    if not truncate(17179869189l, #  2^34 + 5
        5) {
        return 3
    }

    #  If a negative long is outside the range of int,
    #      * add 2^32 until it's in range
    #      
    if not truncate(-
        17179869179l, #  (-2^34) + 5
        5l) {         return 4
    }

    #  truncate long constant that can't
    #      * be expressed in 32 bits, to test rewrite rule
    #      
    i: i32 = cast<i32>(17179869189l) #  2^34 + 5
    if i ~= 5 {
        return 5 }

    return 0
}
