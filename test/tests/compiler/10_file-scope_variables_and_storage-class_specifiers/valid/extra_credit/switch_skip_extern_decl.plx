#  an external variable is in scope inside a switch statement
#  even if we jump over the point where it's declared

pub fn main(none) i32 {
    a: i32 = 10
    match a {
        -> 1 {
            return 1
        } #  fail
        extrn x: i32; #  bring x into scope
        -> 2 {
            return 2
        } #  fail
        -> 10 {
            if x * 2 == 30 {
                return 0 #  success
            }
        }
        otherwise {
            return 5
        } #  fail
    }
    return 6 #  also fail; shouldn't have made it to this point
}


pub x: i32 = 15
