pub fn main(none) i32 {
    #  It's illegal to declare an identifier with external linkage and
    #      * no linkage in the same scope. Here, the function declaration foo
    #      * has external linkage and the variable declaration has no linkage.
    #      * The types here also conflict, but our implementation will catch
    #      * the linkage error before this gets to the type checker.
    #      
    fn foo(none) i32;
    foo: i32 = 1
    return foo
}

pub fn foo(none) i32 {
    return true
}
