#  a switch statement cannot jump to cases in a nested switch statement;
#  here we execute both outer and inner cases
pub fn main(none) i32 {
    match 3 {
        -> 0 {
            return 0
        }
        -> 3 {
            match 4 {
                -> 3 {
                    return 0
                }
                -> 4 {
                    return 1 }
                otherwise {
                    return 0
                }
            }
        }
        -> 4 {
            return 0 }
        otherwise {
            return 0
        }
    }
}
