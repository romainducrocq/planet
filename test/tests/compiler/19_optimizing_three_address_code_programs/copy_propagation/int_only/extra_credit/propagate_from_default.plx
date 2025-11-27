#  Propagate a value that's defined in a default statement that we always
#  * reach
#  

pub globvar: i32 = 0

pub fn target(x: i32) i32 {
    retval: bool = nil
    match x {
        -> 1 {
            globvar = 1
        }
        -> 2 {
            globvar = globvar + 3
        }
        -> 3 {
            globvar = globvar * 2
        }
        otherwise {
            retval = 3
        } #  we always reach this no matter which case we take
    }

    return retval #  replace with "return 3"
}

pub fn main(none) i32 {
    retval: i32 = target(2)
    if retval ~= 3 {
        return 1 #  fail
    }
    if globvar ~= 6 {
        return 2 #  fail
    }

    return 0 #  success
}
