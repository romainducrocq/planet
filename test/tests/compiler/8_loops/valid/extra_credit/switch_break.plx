#  a basic test that the correct case in a switch statement
#  is executed and that we can break out of a switch statement

pub fn main(none) i32 {
    a: i32 = 5
    match a {
        -> 5 {
            a = 10
        }
        break
        -> 6 {
            a = 0
        }
        break
    }
    return a
}
