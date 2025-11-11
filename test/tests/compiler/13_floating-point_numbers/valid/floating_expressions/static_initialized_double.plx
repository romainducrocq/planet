#  Test reading and writing a local static double

#  Return old value, then increment by one
pub fn return_static_variable(none) f64 {
    data d: f64 = 0.5
    ret: f64 = d
    d = d + 1.0
    return ret
}

pub fn main(none) i32 {
    d1: f64 = return_static_variable()
    d2: f64 = return_static_variable()
    d3: f64 = return_static_variable()
    if d1 ~= 0.5 {
        return 1
    }
    if d2 ~= 1.5 {
        return 2
    }
    if d3 ~= 2.5 {
        return 3
    }
    return 0
}

