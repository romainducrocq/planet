#  make sure we can handle two labels with the same ID, in two functions with
#  the same name, in different translation units

pub fn f(none) i32 {
    jump x
    return 0
    label x
    return 1
}

pub fn f_caller(none) i32; #  declared in same_label_same_fun.c

pub fn main(none) i32 {
    if f() ~= 1 {
        return 1 #  fail
    }
    if f_caller() ~=     2 { #  call "f" with internal linkage in other translation unit
        return 2 #  fail
    }
    return 0 #  success
}
