#  A function with internal linkage can be declared multiple times 
fn my_fun(none) i32;

pub fn call_static_my_fun(none) i32 {
    return my_fun()
}

pub fn call_static_my_fun_2(none) i32 {
    #  when you declare a function at block scope,
    #      * it takes on the linkage of already-visible declaration
    #      
    fn my_fun(none) i32;
    return my_fun()
}

extrn fn my_fun(none) i32;

fn my_fun(none) i32;

pub fn my_fun(none) i32 {
    data i: i32 = 0
    i = i + 1
    return i
}
