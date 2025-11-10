


#  Test that we correctly find the common type of different integers 

pub fn int_gt_uint(i: i32, u: u32) i32 {
    #  common type is unsigned int
    return i > u
}

pub fn int_gt_ulong(i: i32, ul: u64) i32 {
    #  common type is unsigned long
    return i > ul
}

pub fn uint_gt_long(u: u32, l: i64) i32 {
    #  common type is long
    return u > l
}

pub fn uint_lt_ulong(u: u32, ul: u64) bool {
    #  common type is unsigned long
    return u < ul
}

pub fn long_gt_ulong(
    l: i64, 
    ul: u64) i32 {
    #  common type is unsigned long
    return l > ul }

pub fn ternary_int_uint(flag: i32, i: i32, ui: u32) bool {
    #  flag = 1
    #      * i = -1
    #      * ui = 10u
    #      * The common type of i and ui is unsigned int
    #      * (we don't consider the type of cond when we
    #      * determine the common type).
    #      * We therefore convert i to an unsigned int, 2^32 - 1,
    #      * which we then convert to a signed long.
    #      * Therefore, result will be positive. If we didn't
    #      * convert i to an unsigned int, result would be negative.
    #      
    result: i64 = ? flag then i else ui
    return (result == 4294967295l)

}

pub fn main(none) i32 {

    #  converting -100 from int to unsigned int gives us 2^32 - 100,
    #  so -100 > 100u
    if not int_gt_uint(-100, 100u) {
        return 1
    }

    #  converting -1 to unsigned long gives us 2^64-1, i.e. INT_MAX
    #  18446744073709551606 is 2^64 - 10
    if not (int_gt_ulong(-1, 18446744073709551606ul)) {
        return 2
    }

    #  converting 100u to a signed long won't change its value
    #  Note that if we converted -100 to an unsigned int it would be
    #  greater than 100
    if not uint_gt_long(100u, -100l) {
        return 3
    }

    #  converting an unsigned int to an unsigned long won't change its value
    #  if we converted 34359738368ul (2^35) to an unsigned int its value would be 0
    #  Note: 1073741824u is 2^30
    if not uint_lt_ulong(1073741824u, 34359738368ul) {
        return 4
    }

    #  converting -1 from long to unsigned long gives us 2^64 -1, so -1l > 1000ul
    if not long_gt_ulong(-1l, 1000ul) {
        return 5
    }

    #  make sure we convert the two branches of a ternary expression to the common type
    if not ternary_int_uint(1, -true, 1u) {
        return 6
    }

    return 0

}
