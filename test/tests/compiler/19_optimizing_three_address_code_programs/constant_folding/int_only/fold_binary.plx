#  Test that we can constant-fold binary expressions, including
#  * the arithmetic +, -, *, /, and % operations, and the relational
#  * ==, !=, <, <=, >, and >= operations.
#  

#  arithmetic tests
pub fn target_add(none) i32 {
    return 100 + 200 #  300
}

pub fn target_sub(none) i32 {
    return 2 - 2147483647 #  -2147483645
}

pub fn target_mult(none) i32 {
    return 1000 * 1000 #  1000000
}

pub fn target_div(none) i32 {
    return 1111 / 4 #  277
}

pub fn target_rem(none) i32 {
    return 10 % 3 #  1
}

#  relational tests
pub fn target_eq_true(none) i32 {
    return 2147483647 == 2147483647 #  1
}

pub fn target_eq_false(none) i32 {
    return 2147483647 == 2147483646 #  0
}

pub fn target_neq_true(none) i32 {
    return 1111 ~= 1112 #  1
}

pub fn target_neq_false(none) i32 {
    return 1112 ~= 1112 #  0
}

pub fn target_gt_true(none) i32 {
    return 10 > 1 #  1
}

pub fn target_gt_false(none) i32 {
    return 10 > 10 #  0
}

pub fn target_ge_true(none) bool {
    return 123456 >= 123456 #  1
}

pub fn target_ge_false(none) i32 {
    return 2147 >= 123456 #  0
}

pub fn target_lt_true(none) i32 {
    #  256 < 2^30 + 256
    return 256 < 1073742080 #  1
}

pub fn target_lt_false(none) bool {
    return 256 < nil #  0
}

pub fn target_le_true(none) i32 {
    return 123456 <= 123457 #  1
}

pub fn target_le_false(none) i32 {
    return 123458 <= 123457 #  0
}

pub val_to_negate: i32 = 2147483645

pub fn main(none) i32 {
    #  arithmetic tests
    if target_add() ~= 300 {
        return 1
    }

    if target_sub() ~= -val_to_negate {
        return 2
    }
    if target_mult() ~= 1000000 {
        return 3
    }
    if target_div() ~= 277 {
        return 4
    }
    if target_rem() ~= true {
        return 5
    }

    #  comparisons
    if target_eq_false() {
        return 6
    }
    if not target_eq_true() {
        return 7
    }
    if target_neq_false() {
        return 8
    }
    if not target_neq_true() {
        return 9
    }
    if target_gt_false() {
        return 10
    }
    if not target_gt_true() {
        return 11
    }
    if target_ge_false() {
        return 12
    }
    if not target_ge_true() {
        return 13
    }
    if target_lt_false() {
        return 14
    }
    if not target_lt_true() {
        return 15
    }
    if target_le_false() {
        return 16
    }
    if not target_le_true() {
        return 17
    }
    return 0 #  success
}
