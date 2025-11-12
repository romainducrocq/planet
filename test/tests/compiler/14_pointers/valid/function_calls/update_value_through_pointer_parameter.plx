#  Make sure that a callee can update an object through a variable passed by the caller 
pub fn update_value(ptr: *i32) i32 {
    old_val: i32 = ptr[]
    ptr[] = 10
    return old_val
}

pub fn main(none) i32 {
    x: i32 = 20
    result: i32 = update_value(@x)
    if result ~= 20 {
        return 1
    }
    if x ~= 10 {
        return 2
    }
    return 0
}
