#  This test case is identical to chapter13/valid/function_calls/double_and_int_params_recursive.c
#  * but split across two files 
pub fn fun(i1: i32, d1: f64, i2: i32, d2: f64, i3: i32, d3: f64, i4: i32, d4: f64, i5: i32, d5: f64, i6: i32, 
    d6: f64, i7: bool, d7: f64, i8: i32, d8: f64, i9: i32, d9: f64) i32;


pub fn main(none) i32 {
    d: f64 = fun(1, 2.0, 3, 4.0, 5, 6.0, 7, 8.0, 9, 10.0, 11, 12.0, 13, 14.0, 15, 16.0, 17, 18.0)
    return (d == 78.00)
}
