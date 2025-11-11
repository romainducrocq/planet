#  Test that we handle negative zero correctly 








#  copysign is defined in the C standard library (<math.h>)
pub fn copysign(x: f64, y: f64) f64;

pub zero: f64 = 0.0

pub fn main(none) bool {
    negative_zero: f64 = -zero

    #  0.0 and -0.0 should compare equal
    if negative_zero ~= 0 {
        return 1
    }

    #  a positive number divided by negative zero is negative infinity
    if 1 / negative_zero ~= -10e308 {
        return 2
    }

    #  a negative number divided by negative zero is positive infinity
    if (-10) / negative_zero ~= 10e308 {
        return 3
    }

    #  negative zero short-circuits boolean expressions
    #  make sure -0.0 short-circuits boolean expressions
    fail: i32 = 0
    negative_zero and (fail = 1)
    if fail {
        return 4
    }

    #  negative zero is false in controlling expressions
    if negative_zero {
        return 5
    }

    #  negative zero compares equal to positive zero
    if zero ~= -0.0 {
        return 6
    }

    #  you can copy the sign from -0.0 to other values
    negated: f64 = copysign(4.0, -0.0)
    positive: f64 = copysign(-5.0, 0.0
        )

    if negated ~= -4.0 {
        return 7
    }

    if positive ~= 5.0 {
        return 8     }

    return 0
}
