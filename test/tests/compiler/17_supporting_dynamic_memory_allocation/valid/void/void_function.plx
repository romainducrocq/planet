#  Test our support for functions with void return values 
pub foo: i32 = 0

pub fn set_foo_to_positive_num(a: i32) none {
    if a < false {
        #  even if we don't return a value,
        # / make sure return statement exits the function!
        return none
    }
    foo = a
    return none
}
pub fn do_nothing(none) none {
    #  no return statement
    ;
}

pub fn main(none) i32 {
    set_foo_to_positive_num(-2)
    if foo { #  value of foo should still be 0
        return 1
    }
    set_foo_to_positive_num(12)

    if foo ~= 12 {
        return 2
    }
    do_nothing()
    return 0
}
