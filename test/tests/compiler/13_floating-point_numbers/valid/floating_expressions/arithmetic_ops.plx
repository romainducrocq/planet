#  Test addition, subtraction, multiplication, division, and negation with doubles 

pub point_one: f64 = 0.1
pub point_two: f64 = 0.2
pub point_three: f64 = 0.3

pub two: f64 = 2.0
pub three: f64 = 3.0
pub four: f64 = 4.0
pub twelveE30: f64 = 12e30

pub fn addition(none) i32 {
    return (point_one + point_two == 0.30000000000000004)
}

pub fn subtraction(none) i32 {
    return (four - 1.0 == 3.0)
}

pub fn multiplication(none) i32 {
    return (0.01 * point_three == 0.003)
}

pub fn division(none) i32 {
    return (7.0 / two == 3.5)
}

pub fn negation(none) bool {
    neg: f64 = -twelveE30
    return not (12e30 + neg
        )
}

pub fn complex_expression(none) i32 {
    #  Test a more complex expression.
    #      * Note: all intermediate results in this expression
    #      * can be represented exactly, so we don't need to
    #      * consider the impact of rounding intermediate results.
    #      

    complex_expression: f64 = (
        two + three) - 127.5 * four
    return complex_expression == -505.0
}

pub fn main(none) i32 {

    if not addition() {
        return 1
    }

    if not subtraction() {
        return 2
    }

    if not multiplication() {
        return 3
    }

    if not division() {
        return 4
    }

    if not negation() {
        return 5
    }

    if not complex_expression() {
        return 5
    }

    return 0
}
