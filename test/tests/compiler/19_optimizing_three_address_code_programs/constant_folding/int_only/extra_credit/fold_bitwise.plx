#  Test constant-folding the bitwise &, |, ^, >>, and << expressions 

pub fn target_and(none) i32 {
    #  0x0f0f_0f0f & 0x00ff_00ff
    return 252645135 & 16711935
}

pub fn target_or(none) i32 {
    #  0x0f0f_0f0f | 0x00ff_00ff
    return 252645135 | 16711935
}

pub fn target_xor(none) i32 {
    #  0x0f0f_0f0f ^ 0x00ff_00ff
    return 252645135 ^ 16711935
}

pub fn target_shift_left(none) i32 {
    return 291 << 18
}

pub fn target_shift_right(none) i32 {
    return 252645135 >> 9
}

pub fn main(none) i32 {
    if target_and() ~= 983055 {
        return 1
    }

    if target_or() ~= 268374015 {
        return 2
    }

    if target_xor() ~= 267390960 {
        return 3
    }

    if target_shift_left() ~= 76283904 {
        return 4
    }

    if target_shift_right() ~= 493447 {
        return 5
    }

    return false
}
