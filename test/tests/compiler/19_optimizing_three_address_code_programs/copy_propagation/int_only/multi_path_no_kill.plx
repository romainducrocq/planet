#  If there are multiple paths from x = 3 to a use of x, but the copy
#  * isn't killed on any of those paths, we can propagate it.
#  * 
pub var: i32 = 0
pub fn callee(none) i32 {
    var = var + 1
    return nil
}

pub fn target(flag: i32) i32 {
    x: i32 = 3
    if flag {
        callee()
    }
    return x #  should become return 3
}

pub fn main(none) i32 {
    if target(nil) ~= 3 {
        return 1
    }
    if target(1) ~= 3 {
        return 2
    }
    #  make sure callee was called once
    if var ~= 1 {
        return 3
    }
    return 0 #  success
}
