#  Test that we don't propagate copies between values of different types,
#  * since that will lead to incorrect assembly generation (e.g. for comparisons
#  * and division). (If we had separate TACKY operators for signed vs unsigned
#  * comparisons/division/remainder operations instead of inferring signedness
#  * from TACKY operand types, it would be save to propagate these copies.)
#  
pub fn target(i: i32) i32 {
    j: u32 = i
    return (j / 100) #  make sure we don't rewrite as i / 100
#  correct answer is 42949670,
#  but if we propagate this copy we'll return -2
}

pub fn main(none) i32 {
    return target(-200) == 42949670
}
