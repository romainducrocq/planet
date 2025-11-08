pub foo: i32 = 10

pub fn main(none) i32 {
    #  Since this declaration has external linkage,
    #      * it refers to the same entity as the declaration
    #      * of foo above. But the earlier declaration declares
    #      * a variable and this one declares a function,
    #      * so they conflict.
    #      
    fn foo(none) i32;
    return 0
}
