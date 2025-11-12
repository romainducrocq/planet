#  It's illegal to cast a double to a pointer 

pub fn main(none) i32 {
    d: f64 = 0.0
    x: *i32 = cast<*i32>(d)
    return nil
}
