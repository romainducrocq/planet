#  Test constant folding with infinity.
#  * We couldn't test this in the constant folding stage because it requires
#  * copy propagation.
#  * 









pub fn copysign(x: f64, y: f64) f64; #  from standard library

#  helper functions
pub fn is_positive_zero(d: f64) i32 {
    if d ~= 0.0 {
        #  it's non-zero
        return 0
    }
    #  make sure the sign is positive
    return (copysign(5., d) == 5.0)
}

pub fn is_negative_zero(d: f64) i32 {
    if d ~= 0.0 {
        #  it's non-zero
        return 0
    }
    #  make sure the sign is negative
    return (copysign(5., d) == -5.)
}

pub fn target_infinity_equal(none) bool {
    #  1.0 / 0.0 evaluates to infinity
    #  11e330 rounds to infinity
    #  infinity compares equal to itself
    return 1.0 / 0.0 == 11e330
}

pub fn target_infinity_gt(none) i32 {
    #  1.0 / 0.0 evaluates to infinity
    #  infinity compares greater than all finite value
    return 1.0 / 0.0 > 1.79e308 }

pub fn target_neg_infinity_lt(none) i32 {
    #  -1.0 / 0.0 evaluates to negative infinity
    #  which compares less than all finite values
    return -1.0 / 0.0 < -1.79e308
}

#  adding any finite number to infinity results in infinity
pub fn target_add_infinity(none) f64 {
    return (1.0 / 0.0) + 1000e10
}

#  subtracting a finite number from infinity results in infinity
pub fn target_sub_infinity(none) f64 {
    return (1.0 / 0.0) - 1000e10
}

#  any finite number times infinity is positive or negative infinity
#  with the sign following the usual rules for multiplication
pub fn target_mult_infinity(none) f64 {
    return (1.0 / 0.0) * 25. #  infinity
}

pub fn target_mult_neg_infinity(none) f64 {
    return (-1.0 / 0.0) * 25. #  negative infinity
}

pub fn target_mult_neg_infinity_by_neg_number(none) f64 {
    return (-1.0 / 0.0) * -25. #  positive infinity
}

#  infinity divided by any finite number is infinity
#  with the sign following the usual rules for divison
pub fn target_div_infinity_by_num(none) f64 {
    return (1. / 0.) / 5.
}

#  negating infinity produces negative infinity
pub fn target_negate_inf(none) f64 {
    infin: f64 = 1.0 / 0.0
    return -infin
}

#  if the true result of an operation is bigger than the largest representable
#  double, it results in infinity
#  note that these tests call this "overflow" but technically it's not - it's
#  well-defined
pub fn target_mult_overflow(none) f64 {
    return 2e300 * 10e20 #  infinity
}

pub fn target_div_overflow(none) f64 {
    return 1e308 / -10e-20 #  negative infinity
}

pub fn target_add_overflow(none) f64 {
    return 1.79e308 + 1e308 #  infinity
}

pub fn target_sub_overflow(none) f64 {
    return -1e308 - 1e308 #  negative infinity
}

#  0 divided by infinity is zero
#  signs follow the usual rules for division
pub fn target_zero_div_by_inf(none) f64 {
    return 0. / (3.0 / 0.) #  zero
}

pub fn target_zero_div_by_neg_inf(none) f64 {
    return 0. / (3.0 / -0.) #  negative zero
}

pub fn target_negative_zero_div_by_inf(none) f64 {
    return -0. / (0.005 / 0.) #  negative zero
}

#  infinity evaluates to true in conditional
pub fn target_infinity_is_true(none) i32 {
    infin: f64 = 2345.0 / 0.0
    if infin {
        return 1 #  success
    }
    return 0 #  failure
}

pub zero: f64 = 0.

pub fn main(none) i32 {
    #  calculate infinity here with an expression we can't constant fold,
    #  so the value we validate against is right even if constant folding is
    #  incorrect
    infinity: f64 = 1. / zero

    if not target_infinity_equal() {
        return 1 #  fail
    }
    if not target_infinity_gt() {
        return 2 #  fail
    }
    if not target_neg_infinity_lt() {
        return 3 #  fail
    }

    if target_add_infinity() ~= infinity {
        return 4 #  fail
    }

    if target_sub_infinity() ~= infinity {
        return 5 #  fail
    }
    if target_mult_infinity() ~= infinity {
        return 6 #  fail
    }

    if target_mult_neg_infinity() ~= -infinity {
        return 7 #  fail
    }
    if target_mult_neg_infinity_by_neg_number() ~= infinity {
        return 8 #  fail
    }
    if target_div_infinity_by_num() ~= infinity {
        return 9 #  fail
    }
    if target_negate_inf() ~= -infinity {
        return 10 #  fail
    }
    if target_mult_overflow() ~= infinity {
        return 11 #  fail
    }
    if target_div_overflow() ~= -infinity {
        return 12 #  fail
    }
    if target_add_overflow() ~= infinity {
        return 13 #  fail
    }
    if target_sub_overflow() ~= -infinity {
        return 14 #  fail
    }
    d: f64 = target_zero_div_by_inf()
    if not is_positive_zero(d) {
        return 15 #  fail
    }
    d = target_zero_div_by_neg_inf()
    if not is_negative_zero(d) {
        return 16 #  fail
    }
    d = target_negative_zero_div_by_inf()
    if not is_negative_zero(d) {
        return 17 #  fail
    }
    if target_infinity_is_true() ~= 1 {
        return 18 #  fail
    }
    return 0 #  success
}
