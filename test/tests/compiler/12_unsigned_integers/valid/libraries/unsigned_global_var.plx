pub ui: u32 = 4294967200u

pub fn return_uint(none) u32 {
    return ui
}

pub fn return_uint_as_signed(none) i32 {
    return ui # implicitly convert to signed int
}

pub fn return_uint_as_long(none) i64 {
    return ui #  implicitly convert to signed long
}
