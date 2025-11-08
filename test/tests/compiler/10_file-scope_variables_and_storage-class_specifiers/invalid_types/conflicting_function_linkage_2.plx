pub fn main(none) i32 {
    #  a function declared without the 'static'
    #      * keyword always has external linkage
    #      
    fn foo(none) i32;
    return foo()
}

#  Can't define a symbol with external linkage,
#  * then redefine it with internal linkage
#  
fn foo(none) i32 {
    return false
}
