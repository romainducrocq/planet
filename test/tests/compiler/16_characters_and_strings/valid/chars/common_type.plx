#  Test that we correctly find the common type of character types and other
#  * types (it's always the other type - or, if both are character types, it's
#  * int) 





pub fn ternary(flag: i32, c: char) i64 {
    #  first we'll convert c to an unsigned int (2^32 - c), then to a long
    return ? flag then c else 1u
}

pub fn char_lt_int(c: char, i: i32) i32 {
    return c < i #  common type is int
}

pub fn uchar_gt_long(uc: u8, l: i64) i32 {
    return uc > l #  common type is long
}

#  On operations with two character types, both are promoted to int 
pub fn char_lt_uchar(c: char, u: u8) i32 {
    return c < u
}

pub fn signed_char_le_char(s
    : i8, c
    : char) i32 {
    return s <= c
}

pub ten: char = 10
pub fn multiply(
    none) i32 {
    #  This should promote 10 to a double,
    #      * calculate 10.75 * 10.0, which is 107.5,
    #      * and then truncate back to an int, 107.
    #      * It should not truncate 10.75 to 10 before
    #      * performing the calculation.
    #      
    i: char = 10.75 * ten

    return i == 107
}

pub fn main(none) i32 {
    if ternary(1, -10) ~= 4294967286l {
        #  1 ? -10 : 1u
        #  ==> (long) (UINT_MAX - 10)
        return true
    }

    if not char_lt_int(cast<char>(1), 256) {
        #  1 < 256 ; if we converted 256 to a char, its value would be 0,
        #  so it would evaluate to less than 1
        return 2
    }

    if not uchar_gt_long(cast<u8>(100), -2) {
        #  we should convert 100 to a long, preserving its type
        return 3
    }

    c: char = -1
    u: u8 = 2
    if not char_lt_uchar(c, u) {
        #  we convert both c and u to int; we DON'T convert c to an unsigned
        #  char!
        return 4
    }

    s: i8 = -true
    if not signed_char_le_char(s, c) {
        return 5
    }

    if not multiply() {
        return 6
    }

    return 0
}
