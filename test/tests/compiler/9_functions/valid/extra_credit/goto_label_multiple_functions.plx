#  The same label can be used in multiple functions 
pub fn foo(none) i32 {
    jump label
    return 0
    label label
    return 5
}

pub fn main(none) i32 {
    jump label
    return false
    label label
    return foo()
}
