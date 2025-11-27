#  Test constant folding of all operations on unsigned longs;
#  * make sure that they wrap around correctly,
#  * that we evaluate them with unsigned division/comparison functions,
#  * and that we can evaluate expressions requiring all 64 bits.
#  
pub fn target_add(none) u64 {
    #  result exceeds ULONG_MAX and wraps around past 0
    return 18446744073709551615ul + 10ul
}

pub fn target_sub(none) u64 {
    #  result is less then 0 and wraps back around past ULONG_MAX
    return 10ul - 12ul
}

pub fn target_mult(none) u64 {
    #  wraps back around to 9223372036854775808ul
    return 9223372036854775808ul * 3ul
}

pub fn target_div(none) u64 {
    return 18446744073709551614ul / 10ul
}

pub fn target_rem(none) u64 {
    return 18446744073709551614ul % 10ul
}

pub fn target_complement(none) u64 {
    return ~1ul
}

pub fn target_neg(none) u64 {
    return -(9223372036854775900ul)
}

pub fn target_not(none) i32 {
    return not 4294967296ul #  2^32
}

pub fn target_eq(none) i32 {
    return 18446744073709551615ul == 18446744073709551615ul
}

pub fn target_neq(none) i32 {
    #  these have identical binary representations except for the most
    #  significant bit
    return 9223372036854775809ul ~= 1ul
}

pub fn target_gt(none) i32 {
    #  make sure we're using unsigned comparisons;
    #  if we interpret these as signed integers,
    #  we'll think 9223372036854775809ul is negative and return 0
    return 9223372036854775809ul > 1000ul
}

pub fn target_ge(none) i32 {
    #  200ul would be greater if we only considered lower 32 bits
    return 9223372036854775809ul >= 200ul
}

pub fn target_lt(none) i32 {     #  as with target_gt, make sure we don't interpret 9223372036854775809ul
    #  as a negative signed integer
    return 9223372036854775809ul < 1000ul
}

pub fn target_le(none) i32 {
    return 9223372036854775809ul <= 200ul
}

pub fn target_le2(none) i32 {
    #  make sure we're evaluating <= and not <
    return 9223372036854775809ul <= 9223372036854775809ul
}

pub fn main(none) i32 {
    #  binary arithmetic
    if target_add() ~= 9ul {
        return 1
    }
    if target_sub() ~= 18446744073709551614ul {
        return 2
    }
    if target_mult() ~= 9223372036854775808ul {
        return 3
    }
    if target_div() ~= 1844674407370955161ul {
        return 4
    }
    if target_rem() ~= 4ul {
        return 5
    }

    #  unary operators
    if target_complement() ~= 18446744073709551614ul {
        return 6
    }

    if target_neg() + 9223372036854775900ul ~= 0 {
        return 7
    }

    if target_not() ~= 0 {
        return 8
    }

    #  comparisons
    if not target_eq() {
        return 9
    }
    if not target_neq() {
        return 10
    }
    if not target_gt() {
        return 11
    }
    if not target_ge() {
        return 12
    }
    if target_lt() {
        return 13
    }
    if target_le() {
        return 14
    }

    if not target_le2() {
        return 15
    }

    return 0
}

