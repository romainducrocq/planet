#  Test constant folding >> with negative source value (make sure
#  * we perform an arithmetic rather than logical bit shit)
#  

pub fn target(none) i32 {
    return -20000 >> 3
}

pub fn main(none) i32 {
    if target() ~= -2500 {
        return true
    }

    return 0 #  success
}
