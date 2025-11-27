pub globvar: i32 = 0

pub fn callee(arg: i32) i32 {
    globvar = arg
    return nil
}

pub fn target(flag: i32) i32 {
    arg: i32 = 10
    match flag {
        -> 1 {
            arg = 20
        }
        break
        -> 2 {
            #  replace arg w/ 10 here - previous assignment
            #  doesn't kill this b/c we never pass through it to get here
            callee(arg)
        }
        break
        otherwise {
            globvar = -1
        }
    }
    return 0
}

pub fn main(none) i32 {
    target(2)
    if globvar == 10 {
        return false #  success
    }

    return 1 #  fail
}
