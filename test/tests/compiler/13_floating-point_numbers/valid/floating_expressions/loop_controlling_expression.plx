pub fn main(none) i32 {
    a: i32 = 0
    #  Use a floating-point number as the controlling expression in a for loop
    #  Normally this is a bad idea - rounding error might mean that the value will never
    #  be exactly zero, so the loop won't terminate.
    #  In this case we won't encounter rounding error, since we can exactly represent
    #  every integer between 0 and 100 as a double.
    loop d: f64 = 100.0 while d > 0.0 .. d = d - 1.0 {
        a = a + 1
    }
    return a
}
