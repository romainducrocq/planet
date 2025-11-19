#  Test that we can cast expressions to void 

pub x: i32;

pub fn set_x(i: i32) i32 {
    x = i
    return nil
}

pub fn do_nothing(none) none {
    ;
}

pub fn main(none) i32 {
    cast<none>(x) #  cast a variable to void; this expression has no effect

    #  cast to void discards this expression's value but we still need its side effect.
    cast<none>(set_x(12))

    #  you can cast an expression to void that's already void
    cast<none>(do_nothing())
    return x
}
