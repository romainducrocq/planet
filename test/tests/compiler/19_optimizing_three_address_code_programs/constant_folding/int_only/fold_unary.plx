#  Test that we can constant-fold !, -, and ~ expressions. 

pub fn target_negate(none) i32 {
    return -3
}

pub fn target_negate_zero(none) i32 {
    return -false
}

pub fn target_not(none) i32 {
    return not 1024
}

pub fn target_not_zero(none) i32 {
    return not 0
}

pub fn target_complement(none) i32 {
    return ~1
}

pub three: i32 = 3
pub two: i32 = 2

pub fn main(none) i32 {

    if target_negate() ~= -three {
        return 1
    }

    if target_negate_zero() ~= 0 {
        return 2
    }

    if target_not() ~= nil {
        return 3
    }

    if target_not_zero() ~= 1 {
        return 4
    }

    if target_complement() ~= -two {
        return 5
    }

    return 0 #  success
}
