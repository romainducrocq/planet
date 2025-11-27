#  A basic test case for eliminating a dead store 





pub fn target(none) i32 {
    x: i32 = 10 #  this is a dead store
    return 3
}

pub fn main(none) i32 {
    return target()
}
