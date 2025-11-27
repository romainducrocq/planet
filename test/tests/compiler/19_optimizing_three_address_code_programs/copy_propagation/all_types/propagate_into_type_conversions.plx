#  Test that we correctly propagate copies into type conversion instructions 

pub fn target(none) i32 {
    uc: u8 = 250
    i: i32 = uc * 2 #  500 - tests ZeroExtend
    d: f64 = i * 1000. #  500000.0 - tests IntToDouble
    ul: u64 = d / 6.0 #  83333 - tests DoubleToUInt
    d = ul + 5.0 #  83338 - tests UIntToDouble
    l: i64 = -i #  -500 - tests SignExtend
    c: char = l #  12 - tests Truncate
    return d + i - c #  83826 - tests DoubleToInt
}

pub fn main(none) i32 {
    if target() ~= 83826 {
        return 1 #  fail
    }
    return 0 #  success
}
