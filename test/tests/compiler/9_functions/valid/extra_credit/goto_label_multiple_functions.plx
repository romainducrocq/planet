#  The same label can be used in multiple functions 
pub fn foo(none) i32 {
    jump lbl
    return 0
    label lbl
    return 5
}

pub fn main(none) i32 {
    jump lbl
    return false
    label lbl
    return foo()
}
