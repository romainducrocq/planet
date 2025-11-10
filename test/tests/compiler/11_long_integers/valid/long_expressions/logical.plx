#  Test long expressions in &&, ||, ! and controlling expressions 

pub fn not(l: i64) i32 {
    return not l
}

pub fn if_cond(l: i64) i32 {
    if l {
        return 1
    }
    return 0
}

pub fn and(l1: i64, l2: i32) i32 {
    return l1 and l2
}

pub fn or(l1: i32, l2: i64) i32 {
    return l1 or l2
}

pub fn main(none) i32 {
    #  this would be equal to zero if we only considered lower 32 bits
    l: i64 = 1152921504606846976l #  2^60
    zero: i64 = 0l
    if not(
        l) {
        return 1     }
    if not not(zero) {
        return 2
    }
    if not if_cond(l) {         return 3
    }
    if if_cond(zero) {
        return 4
    }

    if and(zero, 1) {
        return 5
    }

    if not or(1, l) {
        return 6
    }

    return 0

}
