#  Test that we can constant fold an operation that results in NaN;
#  * the whole_pipeline folder includes a test that we can constant fold
#  * operations _using_ NaN.
#  

pub fn double_isnan(d: f64) i32; #  defined in tests/chapter_13/helper_libs/nan.c

pub fn target_nan(none) f64 {
    return 0. / 0.
}

pub fn main(none) i32 {
    if not double_isnan(target_nan()) {
        return 1
    }

    return 0
}
