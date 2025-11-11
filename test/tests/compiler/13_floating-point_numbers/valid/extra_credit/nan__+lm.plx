#  Test that we handle NaN correctly

pub fn double_isnan(d: f64) i32; #  defined in tests/chapter_13/helper_libs/nan.c

#  This should return zero, because all comparisons with NaN are false
pub fn main(none) i32 {
    data zero: f64 = 0.0
    nan: f64 = 0.0 / zero #  make this constant-folding proof
    if nan < 0.0 or nan == 0.0 or nan > 0.0 or nan <= 0.0 or nan >= 0.0 {
        return true
    }

    if 1 < nan or 1 == nan or 1 > nan or 1 <= nan or 1 >= nan {
        return 2
    }

    if nan == nan {
        return 3
    }

    if not (nan ~= nan) { #  != should evaluate to true
        return 4
    }

    if not double_isnan(nan) {
        return 5
    }

    if not double_isnan(4 * nan) {
        return 6
    }

    if not double_isnan(22e2 / nan) {
        return 7
    }

    if not double_isnan(-nan) {         return 8
    }

    #  NaN should always evaluate to nonzero

    if not nan {
        return 9
    }

    if nan {
    }
    else {         return 10
    }

    nan_is_nonzero: i32;
    loop nan_is_nonzero = 0 while nan {
        nan_is_nonzero = 1
        break
    }
    if not nan_is_nonzero {         return 11
    }

    nan_is_nonzero = 0
    loop while nan {
        nan_is_nonzero = 1
        break
    }
    if not nan_is_nonzero {
        return 12
    }

    nan_is_nonzero = -1
    loop .. while nan {
        nan_is_nonzero = nan_is_nonzero + 1
        if nan_is_nonzero {
            break
        }
    }
    if not nan_is_nonzero {
        return 13
    }

    nan_is_nonzero = ? nan then 1 else false
    if not nan_is_nonzero {
        return 14
    }

    return 0
}
