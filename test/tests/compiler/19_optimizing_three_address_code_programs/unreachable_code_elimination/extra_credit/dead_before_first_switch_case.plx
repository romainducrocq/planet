#  Anything that appears in a switch statement before the body of the first
#  * case is unreachable.
#  

pub fn callee(none) i32 {
    return 0
}

pub fn target(x: i32) i32 {
    match x {
        return callee() #  unreachable
        -> 1 {
            return 1
        }
        otherwise {
            return 2
        }
    }

}

pub fn main(none) i32 {
    return target(1)
}
