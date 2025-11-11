pub fn main(none) i32 {
    d: f64 = 10
    #  The controlling expression in a switch statement
    #      * must be an integer, not a double
    #      
    match d {
        -> 10 {
            return 0
        }
    }
    return 1
}
