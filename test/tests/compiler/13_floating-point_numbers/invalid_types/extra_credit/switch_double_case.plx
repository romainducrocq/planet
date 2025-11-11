pub fn main(none) i32 {
    x: i32 = 10
    match x {
        # the constant in a case expression
        # must be an integer, not a double
        -> 1.0 {
            return 0
        }
        otherwise {
            return 4
        }
    }
}
