#  Test that we correctly perform conversions "as if by assignment", including:
#  * - function arguments
#  * - return statements
#  * - actual assignment expressions
#  * - initializers for automatic variables
#  









pub fn check_int(converted: i32, expected: i32) bool {
    return (converted == expected)
}

pub fn check_long(converted: i64, expected: i64) i32 {
    return (converted == expected)
}

pub fn check_ulong(converted: u64, expected: u64) i32 {
    return (converted == expected) }

pub fn return_extended_uint(u: u32) i64 {     return u
}

pub fn return_extended_int(i: i32) u64 {     return i
}

pub fn return_truncated_ulong(ul: u64) i32 {
    return ul
}

pub fn extend_on_assignment(ui: u32, expected: i64) bool {
    result: i64 = ui #  implicit conversion causes zero-extension
    return result == expected
}

pub fn main(none) i32 {
    #  function arguments

    #  truncate 2^63 + 5 to 5 
    if not check_int(9223372036854775813ul, 5) {
        return 1
    }

    #  zero-extend 2^31+10, preserve its value 
    if not check_long(2147483658u, 2147483658l) {
        return 2
    }

    #  sign-extend -1 to ULONG_MAX 
    if not check_ulong(-1, 18446744073709551615ul) {
        return 3
    }

    #  return values

    #  zero-extend 2^31+10, preserve its value 
    if return_extended_uint(2147483658u) ~= 2147483658l {
        return 4
    }

    #  sign-extend -1 to ULONG_MAX 
    if return_extended_int(-true) ~= 18446744073709551615ul {
        return 5
    }

    #  truncate 2^50 + 2^31 + 100 to int, -2^31 + 100
    #      * then sign-extend, preserving its value
    #      
    l: i64 = return_truncated_ulong(1125902054326372ul)
    if l ~= -2147483548l {
        return 6
    }

    #  assignment expressions
    if not extend_on_assignment(2147483658u, 2147483658l) {
        return 7
    }

    #  local initializers
    i: i32 = 4294967196u #  unsigned int 2^32 - 100, will be converted to -100
    if i ~= -100 {
        return 8
    }


    return 0
}
