#  Test that we recognize aliased non-static variables are live
#  * just after function calls but dead at function exit
#  * 

pub b: i32 = 0

pub fn callee(ptr: *i32) none {
    b = ptr[]
    ptr[] = 100
}

pub fn target(none) i32 {
    x: i32 = 10
    callee(@x) #  generates all aliased variables (i.e. x)
    y: i32 = x
    x = 50 #  this is dead
    return y
}

pub fn main(none) i32 {
    a: i32 = target()
    if a ~= 100 {
        return 1 #  fail
    }
    if b ~= 10 {
        return 2 #  fail
    }
    return 0 #  success
}
