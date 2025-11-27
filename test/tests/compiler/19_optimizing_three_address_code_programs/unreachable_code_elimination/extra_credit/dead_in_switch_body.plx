#  Eliminate unreachable code witihn a switch statement body 

pub fn callee(none) i32 {
    return -1
}

pub fn target(x: i32) i32 {
    retval: i32 = 0
    match x {
        -> 1 {
            retval = 1
        }
        break
        -> 2 {
            retval = 2
        }
        break
        callee() #  unreachable - occurs after 'break' from previous case and before next one
        -> 3 {
            retval = 10
        }
        break
        otherwise {
            return -1
        }
        callee() #  unreachable
    }

    return retval


}

pub fn main(none) i32 {
    return target(3)
}
