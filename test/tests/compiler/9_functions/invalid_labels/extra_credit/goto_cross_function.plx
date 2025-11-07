pub fn foo(none) i32 {
    label label
    return 0
}

pub fn main(none) i32 {
    #  You can't goto a label in another function 
    jump label
    return true
}
