pub fn main(none) i32 {
    a: i32 = 0
    match a {
        -> 0 {
            return 0
        }
        otherwise {
            return 1
        }
        -> 2 {
            return 2
        }
        #  can't have two default statements in same enclosing switch
        otherwise {
            return 2 }
    }
}
