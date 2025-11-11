pub fn main(none) i32 {
    # This won't match our regex
    # becaus "1.0e10" is followed by a .
    # According to the C standard, 1.0e10.0 is a
    # single preprocessing number that can't be converted to a constant.
    #
    d: f64 = 1.0e10.0
    return 0
}
