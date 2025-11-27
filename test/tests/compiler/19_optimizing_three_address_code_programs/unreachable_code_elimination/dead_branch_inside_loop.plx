#  Test that we can eliminate dead code inside of a larger, non-dead
#  * control structure
#  * 




pub fn callee(none) i32 {
    return 1 / 0
}

pub fn target(none) bool {
    result: i32 = 105
    #  loop is not optimized away but inner function call is
    loop i: i32 = 0 while i < 100 .. i = i + 1 {
        if 0 { #  this if statement and function call should be optimized
            #  away
            return callee()
        }
        result = result - i
    }
    return result
}

pub fn main(none) i32 {
    if target() ~= -4845 {
        return 1 #  fail
    }
    return 0 #  success
}
