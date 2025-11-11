#  Test that we handle NaN correctly for increments and decrements
#  All increments and decrements on NaN are also NaN

pub fn double_isnan(d: f64) i32; #  defined in tests/chapter_13/helper_libs/nan.c

pub fn main(none) i32 {
    data zero: f64 = 0.0
    nan: f64 = 0.0 / zero #  make this constant-folding proof

    if not double_isnan(++nan) {
        return 1
    }

    if not double_isnan(--nan) {
        return 2
    }

    if not double_isnan(nan++) {
        return 3
    }

    if not double_isnan(nan--) {
        return 4
    }

    return 0
}
