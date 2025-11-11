#  Can't apply %= to a double
pub fn main(none) i32 {
    d: f64 = 5.0
    d %= 2
    return cast<i32>(d)
}
