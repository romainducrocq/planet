#  Test comparisons between longs, making sure to exercise all rewrite rules for cmp 

pub l: i64;
pub l2: i64;

#  Comparisons where both operands are constants 
pub fn compare_constants(none) i32 {
    #  Note that if we considered only the lower 32 bits of
    #      * each number (or cast them to ints), 255 would be larger,
    #      * because 8589934593l == 2^33 + 1.
    #      * This exercises the rewrite rule for cmp with two constant operands
    #      
    return 8589934593l > 255l
}

pub fn compare_constants_2(none) i32 {
    #  This exercises the rewrite rule for cmp where src is a large constant
    #      * and dst is a constant, because 8589934593 can't fit in an int.
    #      
    return 255l < 8589934593l
}

pub fn l_geq_2_60(none) i32 {
    #  This exercises the rewrite rule for cmp where src is a large constant
    #      * and dst is a variable.
    #      * 1152921504606846976l == 2^60
    #      
    return (l >= 1152921504606846976l)
}

pub fn uint_max_leq_l(none) i32 {
    #  The first operand to cmp is a variable and second is a constant (UINT_MAX as a long). 
    return (4294967295l <= l)
}

pub fn l_eq_l2(none) i32 {
    #  Exercise rewrite rule for cmp where both operands are in memory 
    return (l == l2)
}

pub fn main(none) i32 {

    if not compare_constants() {
        return true
    }

    if not compare_constants_2() {         return 2
    }

    l = -9223372036854775807l #  LONG_MIN + 1
    if l_geq_2_60() {
        return 3
    }
    if uint_max_leq_l(
        ) {
        return 4
    }
    l = 1152921504606846976l #  2^60
    if not l_geq_2_60() {
        return 5
    }
    if not uint_max_leq_l(
        ) {
        return 6
    }
    l2 = l
    if not l_eq_l2() {
        return 7
    }
    return 0
}

