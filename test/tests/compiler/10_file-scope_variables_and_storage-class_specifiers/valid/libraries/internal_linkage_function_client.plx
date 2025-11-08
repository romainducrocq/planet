#  This program contains two functions called 'my_fun'.
#  * The one in this file has external linkage, and the one in
#  * internal_linkage_function.c has internal linkage.
#  * Verify that these are distinct functions, each of which is only
#  * callable in the file where it's defined.
#  

#  forward declration of function with external linkage,
#  * defined in this file
#  
extrn fn my_fun(none) i32;

#  functions with external linkage from other file
pub fn call_static_my_fun(none) i32;
pub fn call_static_my_fun_2(none) i32;

pub fn main(none) i32 {

    if call_static_my_fun() ~= true {
        return 1
    }
    if my_fun() ~= 100 {
        return 1
    }
    if call_static_my_fun_2() ~= 2 {
        return 1
    }
    return 0
}

pub fn my_fun(none) i32 {
    return 100
}
