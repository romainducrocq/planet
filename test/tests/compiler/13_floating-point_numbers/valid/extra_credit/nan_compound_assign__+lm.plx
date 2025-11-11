#  Test that we handle NaN correctly for compound assignments
#  All compound assignments to NaN are also NaN

pub fn double_isnan(d: f64) i32; #  defined in tests/chapter_13/helper_libs/nan.c

pub fn main(none) i32 {
    data zero: f64 = 0.0
    nan: f64 = 0.0 / zero #  make this constant-folding proof

    if not double_isnan(nan += 99.2) {
        return 1
    }

    if not double_isnan(nan -= nan) {
        return 2
    }

    if not double_isnan(nan *= 4.0) {
        return 3
    }

    if not double_isnan(nan /= 0.0) {
        return 4
    }

    return 0
}
