#  The same identifier can be used
#  * in the same scope as both a function name and a label 
pub fn foo(none) i32 {
    jump foo
    return 0
    label foo
    return 1
}

pub fn main(none) i32 {
    return foo()
}
