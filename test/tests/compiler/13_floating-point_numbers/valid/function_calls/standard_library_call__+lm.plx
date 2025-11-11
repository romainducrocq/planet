#  Make sure we can call floating-point functions from the standard library 

#  We need to declare these functions ourselves since we can't #include <math.h> 

#  fused multiply and add: (x * y) + z
#  note: only the final result of the whole calculation is rounded,
#  not the intermediate result x * y
pub fn fma(x: f64, y: f64, z: f64) f64;

pub fn ldexp(x: f64, exp: i32) f64; #  x * 2^exp

pub fn main(none) i32 {
    fma_result: f64 = fma(5.0, 1e22, 4000000.0)
    ldexp_result: f64 = ldexp(92e73, 5)
    if fma_result ~= 50000000000000004194304.0 {
        return 1
    }

    if ldexp_result ~= 2.944e76 {
        return 2
    }

    return 0
}
