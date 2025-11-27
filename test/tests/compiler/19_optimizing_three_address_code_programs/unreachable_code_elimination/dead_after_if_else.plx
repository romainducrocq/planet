#  Test that we recognize call to 'callee' is unreachable;
#  * 

pub fn callee(none) i32 {
    return 100
}

pub fn target(a: i32) bool {
    if a {
        return 1
    }
    else {
        return 2
    }

    return callee() #  this should be optimized away
}
pub fn main(none) i32 {
    if target(1) ~= true {
        return 1 #  fail
    }
    if target(0) ~= 2 {
        return 2 #  fail
    }
    return 0 #  success
}
