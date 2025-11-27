#  A function call generates every aliased variable,
#  * even if that variable isn't passed as a function argument
#  * 
i: *i32;

pub fn set_ptr(arg: *i32) none {
    i = arg
}

pub fn get_ptr_val(none) i32 {
    return i[]
}

pub fn main(none) i32 {
    x: i32 = 1
    set_ptr(@x)
    x = 4 #  not dead b/c x is aliased, and funcall generates it
    return get_ptr_val() #  generates x
}
