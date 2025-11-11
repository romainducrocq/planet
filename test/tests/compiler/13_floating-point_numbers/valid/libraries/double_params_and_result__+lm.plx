#  Pass arguments of double type, including on stack, and return value of double type

pub fn fmax(x: f64, y: f64) f64; #  from math.h

pub fn get_max(a: f64, b: f64, c: f64, d: f64, e: f64, f: f64, g: f64, h: f64, i: f64,
    j: f64, k: f64) f64 {
#  pass three arguments on the stack, make sure we adjust stack padding accordingly

    max: f64 = fmax(        fmax(        fmax
        (        fmax(a, b),         fmax(c, d)),         fmax(        fmax(e, f),         fmax(g, h))),         fmax(i, fmax(j, k)))
    return max
}

