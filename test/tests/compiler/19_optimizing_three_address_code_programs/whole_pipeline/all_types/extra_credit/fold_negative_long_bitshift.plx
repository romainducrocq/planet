#  Test constant folding >> with negative long source value (make sure
#  * we perform an arithmetic rather than logical bit shit)
#  

pub fn target(none) i64 {
    return (-9223372036854775807l - 1) >> 45u
}

pub fn main(none) i32 {
    if target() ~= -262144 {
        return 1
    }

    return 0 #  success
}
