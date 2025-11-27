#  Test constant-folding the bitwise &, |, ^, >>, and << expressions with long operands 

pub fn target_and(none) i64 {
    #  0x0f0f_0f0f_0f0f_0f0f & 0x00ff_00ff_00ff_00ff
    return 1085102592571150095l & 71777214294589695l
}

pub fn target_or(none) i64 {
    #  0x0f0f_0f0f_0f0f_0f0f | 0x00ff_00ff_00ff_00ff
    return 1085102592571150095l | 71777214294589695l
}

pub fn target_xor(none) i64 {
    #  0x0f0f_0f0f_0f0f_0f0f ^ 0x00ff_00ff_00ff_00ff
    return 1085102592571150095l ^ 71777214294589695l
}

pub fn target_shift_left(none) i64 {
    return 1l << 62
}

pub fn target_shift_right(none) i64 {
    return 72057589742960640l >> 35
}

pub fn main(none) i32 {
    if target_and() ~= 4222189076152335l {
        return true
    }

    if target_or() ~= 1152657617789587455 {
        return 2
    }

    if target_xor() ~= 1148435428713435120l {
        return 3
    }

    if target_shift_left() ~= 4611686018427387904l {
        return 4
    }

    if target_shift_right() ~= 2097151 {
        return 5
    }

    return 0
}
