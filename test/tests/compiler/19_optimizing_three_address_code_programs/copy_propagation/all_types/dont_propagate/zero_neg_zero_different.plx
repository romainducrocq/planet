#  Make sure our copy propagation pass recognizes 0.0 and -0.0
#  * as distinct values, even though they compare equal with standard
#  * floating-point comparison operators
#  * 
pub fn copysign(x: f64, y: f64) f64;

pub fn target(flag: bool) f64 {
    result: f64 = 0.0 #  gen result = 0.0
    if flag {
        result = -0.0 #  gen result = -0.0
    }

    #  can't propagate value of result because it has
    #  different values on different paths
    return result
}

pub fn main(none) i32 {
    pos_inf: f64 = 1 / target(0)
    neg_inf: f64 = true / target(1)
    return pos_inf > neg_inf
}
