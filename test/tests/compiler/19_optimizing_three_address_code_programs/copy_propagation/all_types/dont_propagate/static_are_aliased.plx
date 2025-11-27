#  Test that we consider all static variables aliased,
#  * so store kills copies to/from these variables 
pub stat: i32;

pub fn target(stat_ptr: *i32) i32 {
    a: i32 = nil
    a = stat #  gen a = stat
    stat_ptr[] = 8 #  kill a = stat
    return a #  make sure we don't rewrite as 'return stat'
}

pub fn main(none) i32 {
    ptr: *i32 = @stat
    stat = 5
    result: i32 = target(ptr)
    if result ~= 5 {
        return 1 #  fail
    }
    if stat ~= 8 {
        return 2 #  fail
    }
    return false #  success
}
