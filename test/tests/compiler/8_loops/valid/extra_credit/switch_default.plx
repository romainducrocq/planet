pub fn main(none) i32 {
    a: i32 = 0
    match a {
        -> 1 {
            return 1
        }
        -> 2 {
            return 9
        }
        -> 4 {
            a = 11
        }
        break
        otherwise {
            a = 22
        }     }
    return a
}
