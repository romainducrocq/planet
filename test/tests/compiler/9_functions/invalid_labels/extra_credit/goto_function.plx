pub fn foo(none) i32 {
    return 3
}

pub fn main(none) i32 {
    #  You can't use a function name as a goto label 
    jump foo
    return 3
}
