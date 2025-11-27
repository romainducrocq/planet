#  Test constant-folding with INT_MIN 
pub fn target(none) i32 {
    return -2147483647 - 1
}

pub fn main(none) i32 {
    if ~target() ~= 2147483647 {
        return 1 #  fail
    }
    return 0
}
