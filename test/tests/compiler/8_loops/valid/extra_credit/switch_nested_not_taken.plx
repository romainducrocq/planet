#  a switch statement cannot jump to cases in a nested switch statement
pub fn main(none) i32 {
    a: i32 = 0
    #  outer switch will execute default, not nested 'case 0'
    match a {
        -> 1 {
            match a {
                -> 0 {
                    return 0
                }
                otherwise {
                    return 0
                }             }
        }
        otherwise {
            a = 2
        }
    }
    return a
}
