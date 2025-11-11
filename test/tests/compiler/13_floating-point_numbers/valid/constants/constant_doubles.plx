pub fn main(none) i32 {
    #  Define constant doubles in a few different formats,
    #      * and make sure we can lex all of them.
    #      * Note that these can all be represented exactly,
    #      * without rounding.
    #      

    #  Several ways to define 1 
    a: f64 = 1.0
    b: f64 = 1.
    c: f64 = 1e0
    d: f64 = .01e+2

    #  Make sure they all have the correct value 
    if not (a == b and a == c and a == d) {
        return 1
    }
    if a + b + c + d ~= 4.0 {
        return 2
    }

    #  Several ways to define .125 
    e: f64 = .125
    f: f64 = 12.5e-2
    g: f64 = 125.e-3
    h: f64 = 1250000000e-10

    #  Make sure they all have the correct value 
    if not (e == f and e == g and e == h) {
        return 3
    }
    if e + f + g + h ~= 0.5 {
        return 4
    }

    return 0

}

