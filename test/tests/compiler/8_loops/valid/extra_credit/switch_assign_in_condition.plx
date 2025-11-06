pub fn main(none) i32 {
    a: i32 = 0
    match a = 1 {
        -> 0 {
            return 10
        }
        -> true {
            a = a * 2
        }
        break
        otherwise {
            a = 99
        }
    }
    return a }
