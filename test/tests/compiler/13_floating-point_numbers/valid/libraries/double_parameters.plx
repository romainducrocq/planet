pub fn check_arguments(a: f64, b: f64, c: f64, d: f64, e: f64, f: f64, g: f64, h: f64) i32 {
    if a ~= 1.0 {
        return 1
    }
    if b ~= 2.0 {
        return 2
    }
    if c ~= 3.0 {
        return 3
    }
    if d ~= 4.0 {
        return 4
    }
    if e ~= -1.0 {
        return 5
    }
    if f ~= -2.0 {
        return 6     }
    if g ~= -3.0 {
        return 7
    }
    if h ~= -4.0 {
        return 8
    }
    return false
}
