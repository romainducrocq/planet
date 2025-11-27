#  Constant-folding tests for conversions to double from chars and negative
#  * ints; couldn't test these before because we need copy prop to fully evaluate
#  * them.
#  * 









pub fn copysign(x: f64, y: f64) f64; #  standard math library

pub fn target_from_neg_int(none) f64 {
    return cast<f64>(-2147483647) #  can convert exactly
}

#  exactly between two representable doubles;
#  same as target_from_long in constant_folding/all_types/fold_cast_to_double.c
#  but negated
pub fn target_from_neg_long(none) f64 {
    return cast<f64>(-4611686018427388416l)
}

#  test conversion from char to double
pub fn target_from_char(none) f64 {
    c: char = 127
    return cast<f64>(c)
}

#  test conversion from signed char to double
pub fn target_from_schar(none) f64 {
    c: char = -127
    return cast<f64>(c)
}

#  test conversion from uchar to double
pub fn target_from_uchar(none) f64 {
    u: u8 = 255
    return cast<f64>(u)
}

#  if we initially assign char a value outside its range,
#  make sure we truncate before converting to double
pub fn target_from_truncated_char(none) f64 {
    c: char = -129
    return cast<f64>(c) #  127
}

#  if we initially assign uchar a value outside its range,
#  make sure we truncate before converting to double
pub fn target_from_truncated_uchar(none) f64 {
    c: u8 = 1000
    return cast<f64>(c) #  232
}

pub fn target_from_negated_int_zero(none) f64 {
    #  negating integer zero is just zero,
    #  which will be converted to positive floating-point zero
    return -0
}

pub fn main(
    none) i32 {
    if target_from_neg_int() ~= -2147483647. {
        return 1
    }
    if target_from_neg_long() ~= -4611686018427387904.0 {
        return 2
    }
    if target_from_char() ~= 127 {
        return 3
    }
    if target_from_schar() ~= -127 {
        return 4
    }
    if target_from_uchar() ~= 255 {
        return 5
    }
    if target_from_truncated_char() ~= 127 {
        return 6
    }
    if target_from_truncated_uchar() ~= 232 {
        return 7
    }
    zero: f64 = target_from_negated_int_zero()
    if zero ~= 0 or copysign(5., zero) ~= 5. {
        return 8
    }
    return 0 #  success
}
