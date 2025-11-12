#  Test that we can parse a variety of function and variable declarators 

#  Multiple equivalent declarations of the function 'return_3' 
pub fn return_3(none) i32;
pub fn return_3(none) i32;
pub fn return_3(none) i32;
pub fn return_3(none) i32 {
    return 3
}


pub l: i64 = 100 #  used below
#  Multiple equivalent declarations of the function 'two_pointers' 
pub fn two_pointers(val: f64, ptr: *f64) *i64 {
    ptr[] = val
    return @l
}
pub fn two_pointers(val: f64, d: *f64) *i64;
pub fn two_pointers(val: f64, d: *f64) *i64;
pub fn two_pointers(val: f64
    , d: *
    f64) *i64;

#  Multiple equivalent declarations of the function 'pointers_to_pointers' 
pub fn pointers_to_pointers(p: **bool) **u32 {
    data u: u32;
    data u_ptr: *u32;
    u_ptr = @u
    u = p[][]
    return @u_ptr
}
pub fn pointers_to_pointers(p: **i32) **u32;
pub fn pointers_to_pointers(p: **i32) **u32;
pub fn pointers_to_pointers(p: **i32) **u32;

pub fn main(none) i32 {
    #  Declare some variables using a variety of declarators 
    i: i32 = 0
    i_ptr: *i32 = @i
    ptr_to_iptr: **i32 = @i_ptr

    d1: f64 = 0.0
    d2: f64 = 10.0

    d_ptr: *f64 = @d1

    l_ptr: *i64;

    ptr_to_uptr: **u32;

    #  Use functions and variables we just declared 
    i = return_3() #  assign 3 to i
    if i ~= 3 { #  this also updates ptr_to_iptr
        return 1
    }

    if i_ptr[] ~= 3 {
        return 2
    }

    #  call two_pointers and validate the results
    l_ptr = two_pointers(d2, d_ptr)
    #  l_ptr is a pointer to static variable l declared above
    if l_ptr ~= @l {
        return 3
    }

    if l_ptr[] ~= 100 {
        return 4
    }

    #  two_pointers also assigned value of d2 (10.0) to
    #  object referenced by d_ptr, which is d1
    if d_ptr[] ~= 10.0 {
        return 5
    }

    if d1 ~= 10.0 {
        return 6
    }


    #  call pointers_to_pointers and validate the results
    ptr_to_uptr = pointers_to_pointers(ptr_to_iptr)

    if ptr_to_uptr[][] ~= 3 {
        return 7
    }

    return 0
}
