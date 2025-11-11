pub fn non_zero(d: f64) i32 {
    return not d
}

pub fn multiply_by_large_num(d: f64) f64 {
    return d * 2e20
}

pub fn main(none) i32 {

    #  Make sure subnormal numbers are not rounded to zero 
    subnormal: f64 = 2.5e-320

    #  Perform an operation on a subnormal number to produce a normal number 
    if multiply_by_large_num(subnormal) ~= 4.99994433591341498562e-300 {
        return 2
    }

    #  subnormal is non-zero, so !subnormal should be zero
    return non_zero(subnormal)
}
