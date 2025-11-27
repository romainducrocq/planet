#  Test constant folding of Not, JumpIfZero, and JumpIfNotZero with char
#  * operands. (We don't test constant-folding of other operations on char because
#  * they get promoted to int first.)
#  * 







pub fn putchar(c: i32) i32;

pub fn target_not_char(none) i32 {
    x: char = 256 #  0
    return not x #  1
}

pub fn target_not_uchar(none) i32 {
    x: u8 = 256 #  0
    return not x #  1
}

pub fn target_not_true_char(none) i32 {
    x: char = -1
    return not x #  0;
}

pub fn target_and_schar(none) i32 {
    c: i8 = nil
    return c and putchar('a') #  return 1, eliminate call to putchar
}

pub fn target_and_true_char(none) i32 {
    c1: i8 = 44
    c2: char = c1 - 10
    return c1 and c2 #  1
}

pub fn target_or_uchar(none) i32 {
    u: u8 = 250
    return u or putchar('a') #  return 1, eliminate call to putchar
}

pub fn target_or_char(none) i32 {
    c: char = 250
    return c or putchar('a') #  return 1, eliminate call to putchar
}

pub fn target_branch_char(none) char {
    u: u8 = 250
    u = u + 6 #  0
    if u { #  eliminate this branch
        putchar('a')
    }
    return u + 10
}

pub fn main(none
    ) i32 {
    if target_not_char() ~= 1 {
        return 1 #  fail
    }
    if target_not_uchar() ~= 1 {
        return 2 #  fail
    }
    if target_not_true_char() ~= false {
        return 3 #  fail
    }
    if target_and_schar() ~= 0 {
        return 4 #  fail
    }
    if target_and_true_char() ~= 1 {
        return 5 #  fail
    }
    if target_or_uchar() ~= 1 {
        return 6 #  fail
    }
    if target_or_char() ~= 1 {
        return 7 #  fail
    }
    if target_branch_char() ~= 10 {
        return 8 #  fail
    }
    return 0 #  success
}
