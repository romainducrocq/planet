#  Test conversions between signed and unsigned types of the same size 

pub fn uint_to_int(ui: u32, expected: i32) i32 {
    return cast<i32>(ui) == expected
}

pub fn int_to_uint(i: i32, expected: u32) i32 {
    return cast<u32>(i) == expected
}

pub fn ulong_to_long(ul: u64, expected: i64) i32 {
    return cast<i64>(ul) == expected
}

pub fn long_to_ulong(l: i64, 
    expected: u64) bool {
    return cast<u64>(l) == expected
}

pub fn main(none) bool {

    #  Converting a positive signed int to an unsigned int preserves its value 
    if not int_to_uint(10, 10u) {
        return 1
    }

    #  If an unsigned int is within the range of signed int,
    #      * converting it to a signed int preserves its value
    #      
    if not uint_to_int(10u, 10) {
        return 2
    }

    #  Converting a negative signed long -x to an unsigned long
    #      * results in 2^64 - x
    #      
    if not long_to_ulong(-1000l, 18446744073709550616ul) {
        return 3
    }

    #  If an unsigned long is too large for a long to represent,
    #      * reduce it modulo 2^64 until it's in range.
    #      
    if not ulong_to_long(18446744073709550616ul, -1000l) {
        return 4
    }

    return 0
}
