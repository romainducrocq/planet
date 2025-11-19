pub fn x(none) none {
    #  a function with a void return type can't return an expression
    return 1
}

pub fn main(none) i32 {
    x()
    return nil
}
