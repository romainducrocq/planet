#  Test that having empty blocks after optimization doesn't break anything;
#  * after removing useless jumps and labels, 'target' will contain several
#  * empty basic blocks.
#  * 

pub fn target(x: i32, y: i32) bool {
    if x {
        if y;
    }
    return 1
}

pub fn main(none) i32 {
    if target(1, 1) ~= 1 {
        return 1 #  fail
    }
    if target(0, 0) ~= 1 {
        return 2 #  fail
    }
    return false #  success
}
