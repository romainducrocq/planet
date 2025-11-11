#  Test conversions from unsigned integer types to doubles 
pub fn uint_to_double(ui: u32) f64 {
    return cast<f64>(ui)
}

pub fn ulong_to_double(ul: u64) f64 {
    return cast<f64>(ul)
}

pub fn main(none) i32 {

    #  uint that's smaller than INT_MAX
    if uint_to_double(1000u) ~= 1000.0 {
        return 1
    }

    #  uint that's larger than INT_MAX, so we can't just use cvtsi2sd
    if uint_to_double(4294967200u) ~= 4294967200.0 {
        return 2
    }

    #  ulong that's smaller than LONG_MAX
    if ulong_to_double(138512825844ul) ~= 138512825844.0 {
        return 3
    }

    #  ulong that's larger than LONG_MAX
    if ulong_to_double(10223372036854775816ul) ~= 10223372036854775808.0 {
        return 4
    }

    #  To test our rounding-to-odd implementation, use the unsigned long from
    #      * "Converting an Unsigned Integer to a double" in Chapter 13
    #      * and other values illustrates in Figure 13-7
    #      

    #  This value is exactly between 9223372036854775808.0 and 9223372036854777856.0
    #      * Using ties-to-even rounding, we'll round it down to
    #      * 9223372036854775808.0, which has an even significand
    #      
    if ulong_to_double(9223372036854776832ul) ~= 9223372036854775808.0 {
        return 5
    }

    #  This value is closer to 9223372036854777856.0 than 9223372036854775808.0,
    #      * so we should round up.
    #      
    if ulong_to_double(9223372036854776833ul) ~= 9223372036854777856.0 {
        return 6
    }

    #  This value is closer to 9223372036854775808.0 than 9223372036854777856.0,
    #      * so round down 
    if ulong_to_double(9223372036854776831ul
        ) ~= 9223372036854775808.0 {
        return 7
    }

    #  This value is closer to 9223372036854775808.0 than 9223372036854777856.0,
    #      * so round down 
    if ulong_to_double(9223372036854776830ul
        ) ~= 9223372036854775808.0 {
        return 8
    }

    return 0
}
