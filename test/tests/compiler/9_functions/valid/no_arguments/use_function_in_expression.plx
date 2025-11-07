pub fn bar(none) i32 {
    return 9
}

pub fn foo(none) i32 {
    return 2 * bar()
}

pub fn main(none) i32 {
    #  Use multiple function calls in an expression,
    #      * make sure neither overwrites the other's return value in EAX 
    return foo() + bar() / 3
}
