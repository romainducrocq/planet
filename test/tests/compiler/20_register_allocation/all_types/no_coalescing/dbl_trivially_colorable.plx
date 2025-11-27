#  A simple test that we can allocate all the floating-point
#  * pseudos in a program without register pressure.
#  
pub fn target(x: f64, y: f64) i32 {
    return 10 - (3.0 * y + x)
}
