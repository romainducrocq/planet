#  Test that we can propagate 0 between integer and
#  * different pointer types
#  * 
pub fn target(none) *i64 {
    ptr: *i32 = 0
    ptr2: *i64 = cast<*i64>(ptr)
    return ptr2 #  this should be rewritten as 'return 0'
}

pub fn main(none) i32 {
    result: *i64 = target()
    return (not result)
}
