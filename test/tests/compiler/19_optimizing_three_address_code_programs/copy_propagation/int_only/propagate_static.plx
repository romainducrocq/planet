#  Test that we can propagate copies to variables with static storage
#  * duration 
pub x: i32 = 0

pub fn target(none) i32 {
    #  we can propagate value of x, even though it has static storage duration,
    #  b/c no intervening reads/writes
    x = 10
    return x #  should become "return 10"
}

pub fn main(none) bool {
    result: i32 = target()
    if result ~= 10 {
        return 1
    }
    if x ~= 10 {
        return 2
    }
    return 0 #  success
}
