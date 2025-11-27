#  Test constant folding of all operations on unsigned ints;
#  * make sure they wrap around correctly
#  * and that we evaluate them with unsigned division/comparison functions.
#  
pub fn target_add(none) u32 {
    #  result exceeds UINT_MAX and wraps around past 0
    return 4294967295u + 10u
}

pub fn target_sub(none) u32 {
    #  result is less then 0 and wraps back round past UINT_MAX
    return 10u - 12u
}

pub fn target_mult(none) u32 {
    #  wraps back around to 2147483648u
    return 2147483648u * 3u
}

pub fn target_div(none) u32 {
    #  result would be different if we interpreted values as signed
    return 4294967286u / 10u
}

pub fn target_rem(none) u32 {
    #  result would be different if we interpreted values as signed
    return 4294967286u % 10u
}

pub fn target_complement(none) u32 {
    return ~1u
}

pub fn target_neg(none) u32 {
    return -10u
}

pub fn target_not(none) i32 {
    return not 65536u #  2^16
}

pub fn target_eq(none) i32 {
    return 100u == 100u
}

pub fn target_neq(none) i32 {
    #  these have identical binary representations except for the most
    #  significant bit
    return 2147483649u ~= 1u
}

pub fn target_gt(none) i32 {
    #  make sure we're using unsigned comparisons;
    #  if we interpret these as signed integers,
    #  we'll think 2147483649u is negative and return 0
    return 2147483649u > 1000u
}

pub fn target_ge(none) i32 {
    return 4000000000u >= 3999999999u
}

pub fn target_lt(none) i32 {
    #  as with target_gt, make sure we don't interpret 2147483649u
    #  as a negative signed integer
    return 2147483649u < 1000u
}

pub fn target_le(
    none) i32 {
    return 4000000000u <= 3999999999u
}

pub fn main(none) i32 {
    #  binary arithmetic
    if target_add() ~= 9u {
        return 1
    }
    if target_sub() ~= 4294967294u {
        return 2
    }
    if target_mult() ~= 2147483648u {
        return 3
    }
    if target_div() ~= 429496728u {
        return 4
    }
    if target_rem() ~= 6u {
        return 5
    }

    #  unary operators
    if target_complement() ~= 4294967294u {
        return 6
    }

    if target_neg() + 10 ~= 0 {
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

    return 0
}

