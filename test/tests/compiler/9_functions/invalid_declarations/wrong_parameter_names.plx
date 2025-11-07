pub fn foo(a: i32) i32;

pub fn main(none) i32 {
    return foo(3)
}

pub fn foo(x: i32) i32 {
    #  Only the parameter names from this definition are in scope.
    #      * Parameter names from earlier declarations of foo aren't!
    #      
    return a
}
