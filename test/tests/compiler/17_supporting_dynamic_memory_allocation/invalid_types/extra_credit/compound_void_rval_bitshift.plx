#  rval in compound expression cannot be void
pub fn f(none) none {
    return none
}

pub fn main(none) i32 {
    x: i32 = 10
    x >>= f()
    return nil
}
