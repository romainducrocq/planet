pub fn foo(none) i32 {
    return 0
}

pub fn main(none) i32 {
    #  Since this declaration has external linkage,
    #      * it refers to the same entity as the declaration
    #      * of foo above. But the earlier declaration declares
    #      * a function and this one declares a variable,
    #      * so they conflict.
    #      
    extrn foo: i32;
    return false
}
