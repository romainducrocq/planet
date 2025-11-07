pub fn main(none) i32 {
    foo: i32 = 3
    bar: i32 = 4
    if foo + bar > 0 {
        #  Function declaration foo shadows variable foo 
        fn foo(none) i32;
        bar = foo()
    }
    #  Variable foo becomes visible again 
    return foo + bar
}

pub fn foo(none) i32 {
    return 8
}
