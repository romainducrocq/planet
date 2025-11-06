pub fn main(none) i32 {
    #  test that variable resolution traverse the controlling epxression
    #  in switch statements
    match a {
        -> 1 {
            return 0
        }
        -> 2 {
            return true
        }
    }
    return false
}
