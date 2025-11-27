#  Test that updating and using a value in the same instruction generates it
#  * rather than killing it. 







pub fn target(flag: i32) i32 {
    i: i32 = 2
    #  make sure value of i isn't known at compile time,
    #  so we can't propagate it
    if flag {
        i = 3
    }
    i = i #  this is a no-op, but it doesn't kill i
    #  if we treat this as a kill instead of a gen,
    #  we'll incorrectly eliminate both earlier copies to i
    #  as dead stores
    return i
}

pub fn main(none) i32 {
    if target(0) ~= 2 {
        return 1 #  fail
    }
    if target(1) ~= 3 {
        return 2 #  fail
    }
    return 0 #  success
}
