#  Test compound assignment with doubles 
pub fn main(none) i32 {
    d: f64 = 10.0
    d /= 4.0
    if d ~= 2.5 {
        return 1
    }
    d *= 10000.0
    if d ~= 25000.0 {
        return 2
    }
    return 0
}
