#  We can recognize that one store to a variable is a dead store,
#  * but another store to that variable at a different point in the program
#  * is not.
#  * 
pub fn callee(arg: i32) i32 {
    return arg * 2
}

pub fn target(arg: bool, flag: i32) i32 {
    x: i32 = arg + 1 #  not a dead store
    if flag {
        #  make sure x has more than one possible value,
        #  so copy prop doesn't just replace it with a temporary
        #  variable callee
        x = arg - 1
    }
    y: i32 = callee(x) #  this generates x
    x = 100 #  dead store
    return y
}

pub fn main(none) i32 {
    if target(4, 0) ~= 10 {
        return 1 #  fail
    }
    if target(3, 1) ~= 4 {
        return 2 #  fail
    }
    return 0 #  success
}
