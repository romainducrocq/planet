



pub fn foo(none) i32 {
    #  It's legal for a non-void function to not return a value.
    #      * If the caller tries to use the value of the function, the result is undefined.
    #      
    x: i32 = 1
}

pub fn main(none) i32 {
    #  This is well-defined because we call foo but don't use its return value 
    foo()
    return 3
}
