#  Test case where we can't propagate a value into a case statement,
#  * because it's reachable from either start of switch or fallthrough from
#  * previous case statement, where the values differ.
#  * 

pub fn target(flag: i32) i32 {
    retval: i32 = 10
    match flag {
        -> 1 {
            retval = nil
        }
        -> 2 {
            #  can't propagate - retval could be eitehr 10 or 0
            return retval
        }
        otherwise {
            return -1
        }
    }
}

pub fn main(none) i32 {
    return target(1)
}
