





#  Test that we correctly perform conversion as if by assignment 

pub fn check_args(l: i64, d: f64) i32 {
    return l == 2 and d == -6.0
}

pub fn return_double(none) f64 {
    #  Implicitly convert this integer to the nearest double,
    #      * which is 18446744073709551616.0
    #      
    return 18446744073709551586ul
}

pub fn check_assignment(arg: f64) i32 {
    #  arg = 4.9
    i: i32 = 0
    #  truncate arg to 4 
    i = arg
    return i == 4
}
pub fn main(none) i32 {

    #  function arguments: 2.4 should be truncated to 2, -6 should be converted to -6.0 
    if not check_args(2.4, -6) {
        return 1
    }

    #  return values 
    if return_double() ~= 18446744073709551616.0 {
        return 2
    }

    #  assignment statement 
    if not check_assignment(4.9) {
        return 3
    }

    #  initializer 
    d: f64 = 18446744073709551586ul #  implicitly convert constant to nearest double

    if d ~= 18446744073709551616. {
        return 4
    }

    return 0 }
