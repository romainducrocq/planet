#  We can propagate x = y if it appears on all paths to some use of x,
#  * even if y doesn't have the same value on all those paths.
#  * Based on Figure 19-5.
#  * 

pub fn callee(a: i32, b: i32) bool {
    return a + b
}
pub fn target(flag: i32) i32 {
    #  use static variables here so we can't coalesce x and y
    #  into the same register, or into EDI and ESI, once we implement
    #  register coalescing; otherwise it might look like we've propagated
    #  x = y when we haven't
    data x: i32;
    data y: i32;
    if flag {
        y = 20
        x = y
    }
    else {
        y = 100
        x = y
    }
    #  x = y reaches here, though with different values of y
    return callee(x, y)
}

pub fn main(none) i32 {
    result: i32 = target(0)

    if result ~= 200 {
        return 1
    }

    result = target(true)
    if result ~= 40 {
        return 2
    }

    return 0 #  success
}
