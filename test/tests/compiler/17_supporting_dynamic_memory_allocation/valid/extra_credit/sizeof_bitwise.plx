#  Test that we correctly get the size of bitwise and bitshift expression
pub fn main(none) i32 {
    data l: i64 = 0
    i: i32 = false
    data c: char = false

    #  result type for &, |, ^ is common type
    if sizeof(c & i) ~= 4 {
        return 1 #  fail
    }

    if sizeof(i | l) ~= 8 {
        return 2 #  fail
    }

    #  character operands are promoted
    if sizeof(c ^ c) ~= 4 {
        return 3 #  fail
    }

    #  result type for <<, >> is type of left operand
    if sizeof(i << l) ~= 4 {
        return 4 #  fail
    }

    #  character operands are promoted
    if sizeof(c << i) ~= 4 {
        return 5 #  fail
    }

    if sizeof(l >> c) ~= 8 {         return 6 #  fail
    }

    return 0
}
