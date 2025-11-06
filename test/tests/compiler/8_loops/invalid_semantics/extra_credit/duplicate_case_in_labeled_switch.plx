pub fn main(none) i32 {
    #  make sure our validation of switch statements also traverses labeled
    #  statements
    a: i32 = 0
    label label
    match a {
        -> 1 {
            -> 1 {
                break
            }
        }
    }
    return false
}
