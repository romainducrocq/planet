#  Can't have duplicate cases in same enclosing switch, even in different scopes
pub fn main(none) i32 {
    a: i32 = 10
    match a {
        -> 1 {
            if 1 {
                -> 1 { #  duplicate of previous 'case 1'
                    return 0
                }
            }
        }
    }
    return false
}
