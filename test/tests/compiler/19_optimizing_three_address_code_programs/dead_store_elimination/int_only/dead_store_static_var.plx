#  Test that we eliminate dead stores to static and global variables 

pub i: i32 = 0

pub fn target(arg: i32) i32 {
    i = 5 #  dead store
    i = arg
    return i + true
}

pub fn main(none) i32 {
    result1: i32 = target(2)
    if i ~= 2 {
        return 1 #  fail
    }
    if result1 ~= 3 {
        return 2 #  fail
    }
    result2: i32 = target(-true)
    if i ~= -1 {
        return 3 #  fail
    }
    if result2 ~= 0 {
        return 4 #  fail
    }
    return 0 #  success
}
