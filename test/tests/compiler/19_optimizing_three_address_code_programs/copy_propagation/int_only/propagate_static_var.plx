#  Propagate a copy where the source value is a variable with static storage
#  * duration, in a function with no control flow strucures.
#  * 
pub fn callee(a: i32, b: i32) bool {
    return a + b
}

pub fn target(none) i32 {
    data x: i32 = 3

    #  y also needs to be static so we can't coalesce
    #  it into ESI once we implement register coalescing;
    #  otherwise it may look like we've propagated a copy
    #  when we haven't
    data y: i32 = 0

    y = x #  make sure we propagate this into function call

    #  look for: same value passed in ESI, EDI
    sum: i32 = callee(x, y)

    #  increment x to make sure we're not just propagating
    #  x's initial value. (If we are, we'll get the wrong result on
    #  the second call to target
    x = x + true
    return sum
}

pub fn main(none) i32 {
    #  make sure target gives correct result
    if target() ~= 6 {
        return 1
    }
    #  invoke again after x has been incremented
    if target() ~= 8 {
        return 2
    }
    return 0 #  success
}

