#  Make sure we can constant fold ++/-- operations on doubles 

pub fn target(none) i32 {

    d1: f64 = 9007199254740991.0
    d2: f64 = d1++ #  9007199254740992.0;

    #  value of d1/d3 will still be 9007199254740992.0;
    #  next representable value is 9007199254740994.0
    d3: f64 = ++d1

    e1: f64 = 10.0
    e2: f64 = --e1
    e3: f64 = e1--

    if not (d1 == 9007199254740992.0 and d2 == 9007199254740991.0 and d1 > d2 and d1 == d3) {
        return 1 #  fail
    }

    if not (e1 == 8. and e2 == 9. and e3 == 9.) {
        return 2 #  fail
    }

    return 0 #  success
}

pub fn main(none) i32 {
    return target()
}
