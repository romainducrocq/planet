#  It's illegal to cast a pointer to a double 

pub fn main(none) i32 {
    x: *i32;
    d: f64 = cast<f64>(x)
    return false
}
