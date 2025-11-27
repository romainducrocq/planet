#  Make sure we can eliminate redundant copies where source is NaN
#  * (which requires us to compare NaN values appropriately and recognize when
#  * they're the same even though NaN doesn't compare equal to itself).
#  * We should be able to eliminate all control-flow instructions from target
#  

pub fn double_isnan(d: f64) i32; #  defined in tests/chapter_13/helper_libs/nan.c

pub na: f64;

pub fn target(flag: i32) bool {
    na = 0.0 / 0.0
    d: f64 = 0.0 / 0.0
    if flag {
        na = d #  same value it already is; can delete this
    }
    return 0
}

pub fn main(none) i32 {
    target(1)
    if not double_isnan(na) {
        return 1 #  fail
    }

    return 0
}
