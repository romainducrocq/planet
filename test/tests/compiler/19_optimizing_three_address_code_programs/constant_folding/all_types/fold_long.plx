#  Test constant folding of operations on long ints.
#  * Make sure we correctly handle operations that require all 64 bits.
#  * Tests do not involve any overflow, since that's undefined behavior.
#  
pub fn target_add(none) i64 {
    #  we can add longs when the result exceeds INT_MAX
    return 2147483647l + 1000l
}

pub fn target_sub(none) i64 {
    #  we can subtract longs when the result is smaller than INT_MIN
    return 1000l - 9223372036854773807l
}

pub fn target_mult(none) i64 {
    #  can multiply longs when the result exceeds INT_MAX
    return 35184372088832l * 4l
}

pub fn target_div(none) i64 {
    #  both operands are larger than INT_MAX
    return 9223372036854775807l / 3147483647l
}

pub fn target_rem(none) i64 {
    #  both operands are larger than INT_MAX
    return 9223372036854775807l % 3147483647l
}

pub fn target_complement(none) i64 {
    #  alternating 1s and 0s
    return ~6148914691236517206l
}

pub fn target_neg(none) i64 {
    #  except for most significant bit, upper 32 bits of negated value are all
    #  zeros
    return -(9223372036854775716l)
}

pub fn target_not(none) i32 {
    #  2^56 + 2^45 + 2^44
    #  lower 32 bits are all zeros
    return not 72110370596061184l
}

pub fn target_eq(none) i32 {
    return 9223372036854775716l == 9223372036854775716l
}

pub fn target_neq(none) i32 {
    #  lower 32 bits of 72110370596061184l are all zeros
    return 72110370596061184l ~= 0l
}

pub fn target_gt(none) i32 {
    #  second operand is greater, but if we only looked at lower
    #  32 bits we'd think the first was greater
    return 549755813889l > 17592186044416l #  2^39 + 1 > 2^44
}

pub fn target_ge(none) i32 {
    return 400l >= 399l
}

pub fn target_lt(none) i32 {     #  compare two values whose lower 32 bits are identical
    return 17592186044416l < 549755813888l #  2^44 < 2^39
}

pub fn target_le(none) i32 {
    #  if we interpreted this as a signed int it would be negative
    return 2147483648l <= 0l
}

pub sub_result: i64 = 9223372036854772807l
pub complement_result: i64 = 6148914691236517207l
pub neg_result: i64 = 9223372036854775716l

pub fn main(none) i32 {
    #  binary arithmetic
    if target_add() ~= 2147484647l {
        return 1
    }
    if target_sub() ~= -sub_result {
        return 2
    }
    if target_mult() ~= 140737488355328l {
        return 3
    }
    if target_div() ~= 2930395538l {
        return 4
    }
    if target_rem() ~= 1758008721l {
        return 5
    }

    #  unary operators
    if target_complement() ~= -complement_result {
        return 6
    }

    if target_neg() ~= -neg_result {
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
    if target_gt() {
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

    return nil
}

