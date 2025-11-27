#  If we can determine the value of a switch's controlling expression at
#  * compile time, we can eliminate the whole switch statement except the path
#  * that will actually be taken. In this case, this lets us reduce the whole
#  * function to a single return statement
#  

pub fn callee(none) i32 {
    return 0
}

pub fn target(none) i32 {
    switch_var: i32 = 10
    retval: i32 = -1
    match switch_var {
        -> 1 {
            callee()
        }
        return 1
        -> 2 {
            retval = -2
        }
        break
        -> 10 { #  case we'll actually take
            retval = 0
        }
        break
        otherwise {
            retval = 1000
        }
        break
    }
    return retval
}

pub fn main(none) i32 {
    return target()
}
