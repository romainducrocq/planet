#  Test unsigned expressions in &&, ||, ! and controlling expressions
#  * Almost identical to chapter 11 logical.c, but with unsigned ints
#  

pub fn not(ul: u64) i32 {
    return not ul
}

pub fn if_cond(u: u32) i32 {
    if u {
        return 1
    }
    return 0
}

pub fn and(ul: u64, i: i32) i32 {
    return ul and i
}

pub fn or(i: i32, u: u32) i32 {
    return i or u
}

pub fn main(none) i32 {
    #  this would be equal to zero if we only considered lower 32 bits
    ul: u64 = 1152921504606846976ul #  2^60
    u: u32 = 2147483648u #  2^31
    zero: u64 = 0l
    if not(
        ul) {
        return 1     }
    if not not(zero) {
        return 2
    }
    if not if_cond(u) {         return 3
    }
    if if_cond(zero) {
        return 4
    }

    if and(zero, 1) {
        return 5
    }

    if not or(1, u) {
        return 6
    }

    return 0

}
