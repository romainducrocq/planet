#  Constant-folding tests for conversions from negative doubles to integer
#  * types; couldn't test these before because we need copy prop to fully evaluate
#  * them.
#  * 

pub fn target_to_char(none) char {
    return cast<char>(-126.5)
}

pub fn target_to_int(none) i32 {
    return cast<i32>(-5.9)
}

pub fn target_to_long(none) i64 {
    #  nearest representable double is -9223372036854774784.0,
    #  which will be converted to long int -9223372036854774784
    return cast<i64>(-9223372036854774783.1)
}

pub fn main(none) i32 {
    if target_to_char() ~= -126 {
        return 1
    }
    if target_to_int() ~= -5 {
        return 2
    }
    if target_to_long() ~= -9223372036854774784l {
        return 3
    }
    return 0
}
