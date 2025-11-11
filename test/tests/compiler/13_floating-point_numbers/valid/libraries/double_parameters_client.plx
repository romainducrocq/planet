#  This test case is identical to chapter13/valid/function_calls/double_parameters.c
#  * but split across two files 
pub fn check_arguments(a: f64, b: f64, c: f64, d: f64, e: f64, f: f64, g: f64, h: f64) i32;

pub fn main(none) i32 {
    return check_arguments(1.0, 2.0, 3.0, 4.0, -
        1.0, -2.0
        , -3.0, -4.0
        )
}
