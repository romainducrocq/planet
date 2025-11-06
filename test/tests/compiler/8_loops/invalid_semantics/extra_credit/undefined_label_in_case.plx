#  make sure we apply usual label validation in switch statement
pub fn main(none) i32 {
    a: i32 = 3
    match a {
        -> 1 {
            jump foo
        }
        otherwise {
            return 0
        }
    }
    return 0
}
