#  Can't have two default statements in same enclosing switch, even in different scopes
pub fn main(none) i32 {
    a: i32 = 10
    match a {
        -> 1 {
            loop i: i32 = 0 while i < 10 .. i = i + 1 {
                continue
                loop while true {
                    otherwise {
                        ;
                    }
                }
            } }
        -> 2 {
            return 0
        }
        otherwise {
            ;
        }
    }
    return 0 }
