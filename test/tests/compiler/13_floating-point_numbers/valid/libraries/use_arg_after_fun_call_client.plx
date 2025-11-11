#  This test case is identical to chapter13/valid/function_calls/use_arg_after_fun_call.c
#  * but split across two files 
pub fn fun(x: f64) f64;

pub fn main(none) i32 {
    return fun(1.0)
}
