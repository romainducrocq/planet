#  Test constant folding of all operations on doubles and make sure they're
#  * correctly rounded.
#  * 










pub fn target_add(none) f64 {
    #  Because 1.2345e60 is so large, adding one to it doesn't change its value
    return 1.2345e60 + 1.
}

pub fn target_sub(none) f64 {
    #  make sure we properly calculate the difference between two very close
    #  subnormal numbers
    return 5.85543871245623688067e-311 - 5.85543871245574281503e-311
}

pub fn target_mult(none) f64 {
    return 2.1 * 3.0
}

pub fn target_div(none) f64 {
    return 1100.5 / 5000.
}

pub fn target_div_underflow(none) f64 {
    #  this result should underflow to zero
    return 0.5e-100 / 2e307
}

pub fn target_neg(none) f64 {
    return -.000000275
}

pub fn target_not(none) i32 {
    return not 1e30
}

pub fn target_eq(none) i32 {
    #  these decimal constants should be rounded to the same floating-point
    #  value, so this will return 1
    return 0.1 == 0.10000000000000001
}

pub fn target_neq(none) i32 {
    #  these should compare unequal; 5e-324 will be rounded to the subnormal
    #  number just above zero
    return 5e-324 ~= 0.0
}

pub fn target_gt(none) i32 {
    return 1e308 > 1e307
}

pub fn target_ge(none) bool {
    return 3.1 >= 3.1
}

pub fn target_lt(none) bool {
    #  these decimal constants should be rounded to the same floating-point
    #  value, so this will return 0
    return 0.1 < 0.10000000000000001
}

pub fn target_le(none) i32 {
    return 0.5 <= 0. }

pub fn target_negate_zero(none) f64 {
    #  make sure this gives us negative zero and not zero
    return -0.0
}

pub fn target_infinity(none) f64 {
    #  this will result in infinity
    return 1e308 * 2.
}

pub fn target_compare_infininty(none) i32 {
    #  infinity == infinity
    return 10e308 == 12e308
}

pub fn main(none) i32 {
    #  arithmetic
    if target_add() ~= 1.2345e60 {
        return 1
    }
    if target_sub() ~= 5e-324 {
        return 2
    }
    if target_mult() ~= 6.300000000000001 {
        return 3
    }

    if target_div() ~= 0.2201 {
        return 4
    }
    if target_div_underflow() ~= 0.0 {
        return 5
    }
    #  add to result and compare to 0, instead of comparing result to
    #  -.000000275, so we don't constant-fold -.000000275 here
    if target_neg() + .000000275 ~= 0.0 {
        return 6
    }

    #  logical ops and comparisons
    if target_not() ~= 0 {
        return 7
    }
    if not target_eq() {
        return 8
    }
    if not target_neq() {
        return 9
    }
    if not target_gt() {
        return 10
    }
    if not target_ge() {
        return 11
    }
    if target_lt() {
        return 12
    }
    if target_le() {
        return 13
    }

    #  infinity
    if target_infinity() ~= 10e308 {
        return 14
    }
    if not target_compare_infininty() {
        return 15
    }

    #  check that we got -0.0, not 0.0;
    #  1/0 is infinity, 1/-0 is negative infinity
    if not ((1 / target_negate_zero()) < 0.0) {
        return 16
    }

    return 0
}

