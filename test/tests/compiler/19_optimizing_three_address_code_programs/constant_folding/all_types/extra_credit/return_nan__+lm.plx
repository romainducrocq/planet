#  Test case where we return NaN after constant folding 

pub fn double_isnan(d: f64) i32; #  defined in tests/chapter_13/helper_libs/nan.c

pub fn target(none) f64 {
    return 0.0 / 0.0
}

pub fn main(none) i32 {
    nan: f64 = target()
    if double_isnan(nan) {
        return 0 #  success
    }

    return 1 #  fail
}
