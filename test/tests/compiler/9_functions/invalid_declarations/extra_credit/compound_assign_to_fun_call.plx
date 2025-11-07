pub fn x(none) i32;

pub fn main(none) i32 {
    #  a function call is not an lvalue
    #  NOTE: in later chapters we'll detect this during type checking
    #  rather than identifier resolution
    x() += 1
    return 0
}
