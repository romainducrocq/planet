#  If a copy appears on one path to a block but not on all
#  * paths to that block, it doesn't reach that block.
#  * 

pub fn three(none) i32 {
    return 3
}

pub fn target(flag: i32) bool {
    x: i32;
    if flag {
        x = 10
    }
    else {
        x = three()
    }
    #  one predecessor contains copy x = 10, other predecessor contains no
    #  copies to x, so no copies reach 'return x'
    return x
}

pub fn main(none) i32 {
    if target(1) ~= 10 {
        return 1
    }
    if target(0) ~= 3 {
        return 2
    }
    return 0 #  success
}
