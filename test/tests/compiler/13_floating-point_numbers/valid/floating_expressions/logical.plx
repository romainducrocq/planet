#  Test doubles in &&, ||, ! and controlling expressions 










pub zero: f64 = 0.0
pub non_zero: f64 = 1e-20
pub one: f64 = 1.0
#  this number is so small it will be rounded to zero
pub rounded_to_zero: f64 = 1e-330

pub fn main(none) i32 {

    #  double as controlling expression in if statement 

    if zero {
        return 1
    }

    if rounded_to_zero {
        return 2
    }

    if non_zero; #  no-op; should take this one
    else {
        return 3
    }

    #  constant doubles as controlling expression 
    if 0.e10 {
        return 4
    }

    #  ! operator 
    if not non_zero {
        return 5
    }

    if not (not zero) {
        return 6
    }

    if not (not rounded_to_zero) {
        return 7
    }

    #  && operator - test w/ mix of floating-point and non-floating-point operands 

    if not (non_zero and 1.0) {
        return 8
    }

    if 3.0 and zero {
        return 9
    }

    if rounded_to_zero and 1000e10 {
        return 10
    }


    #  mix of double and integer operands
    if 18446744073709551615ul and zero {
        return 11
    }

    if not (non_zero and 5l) {
        return 12
    }


    #  || operator 

    if not (5.0 or 
        zero) {
        return 13
    }

    if zero or rounded_to_zero {         return 14
    }

    if not (rounded_to_zero or 0.0001) {
        return 15     }

    #  mix of double and integer operands
    if not (non_zero or 0u) {
        return 16
    }

    #  try || with two constants
    if not (0 or 0.0000005) {
        return 17
    }

    return 0

}

