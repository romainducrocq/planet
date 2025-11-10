#  Test conversions from narrower to wider types 

pub fn int_to_ulong(i: i32, expected: u64) i32 {
    result: u64 = cast<u64>(i)
    return result == expected
}

pub fn uint_to_long(ui: u32, expected: i64) i32 {
    result: i64 = cast<i64>(ui)
    return result == expected
}

pub fn uint_to_ulong(ui: u32, expected: u64) i32 {
    return cast<u64>(ui) == expected
}

pub fn main(none) i32 {
    #  Converting a positive int to an unsigned long preserves its value 
    if not int_to_ulong(10, 
        10ul) {
        return 1     }

    #  When you convert a negative int to an unsigned long,
    #      * add 2^64 until it's positive
    #      
    if not int_to_ulong(-10, 18446744073709551606ul) {
        return 2     }

    #  Extending an unsigned int to a signed long preserves its value 
    if not uint_to_long(4294967200u, 4294967200l) {
        return 3
    }

    #  Extending an unsigned int to an unsigned long preserves its value 
    if not uint_to_ulong(4294967200u, 4294967200ul) {
        return 4
    }
    #  Zero-extend constant 4294967200
    #      * from an unsigned int to an unsigned long
    #      * to test the assembly rewrite rule for MovZeroExtend
    #      
    if cast<u64>(4294967200u) ~= 4294967200ul {
        return 5
    }
    return false
}

