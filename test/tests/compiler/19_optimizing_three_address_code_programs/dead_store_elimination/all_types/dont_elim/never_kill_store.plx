#  Dead store elimination should never eliminate Store instructions
#  * 
pub fn f(ptr: *i32) none {
    ptr[] = 4 #  not a dead store!
    return none
}

pub fn main(none) bool {
    x: i32 = 0
    f(@x)
    return x
}
