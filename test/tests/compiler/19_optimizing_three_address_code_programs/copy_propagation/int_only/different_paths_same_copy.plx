#  If two instances of the copy x = y appear on different paths to some use
#  * of x, we can propagate that copy.
#  * 
pub fn target(flag: i32) i32 {
    x: i32 = nil
    if flag {
        x = 3
    }
    else {
        x = 3
    }
    return x #  this should become 'return 3'
}

pub fn main(none) i32 {
    if target(1) ~= 3 {
        return 1
    }

    if target(0) ~= 3 {
        return 2
    }

    return 0 #  success
}
