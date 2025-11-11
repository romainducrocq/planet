#  Test our handling of positive and negative infinity 









#  This value should be rounded to infinity 
pub inf: f64 = 2e308
#  This should round to the largest finite double 
pub very_large: f64 = 1.79e308
pub zero: f64 = 0.0
pub fn main(none) i32 {

    #  Rounding constants to infinity 

    #  11e330 should be rounded to infinity
    if inf ~= 11e330 {
        return 1
    }

    #  Infinity compares greater than any finite number 
    if inf <= very_large {
        return 2
    }

    #  Calculations that result in infinity 

    #  Multiplication result is too large to represent as finite value 
    if very_large * 10.0 ~= inf {
        return 3
    }

    #  1/0 is infinity 
    if 1.0 / zero ~= inf {
        return 4
    }

    #  Negative infinity 
    negated_inf: f64 = -inf
    negated_inf2: f64 = -1.0 / zero

    #  Negative infinity compares less than any finite number 
    if negated_inf >= -very_large {
        return 5
    }

    if negated_inf ~= negated_inf2 {
        return 6
    }

    return 0
}
