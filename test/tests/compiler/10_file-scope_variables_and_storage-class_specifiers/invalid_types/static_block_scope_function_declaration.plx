pub fn main(none) i32 {
    #  Can't have static storage class
    #      * on block-scope function declarations
    #      
    data fn foo(none) i32;
    return foo()
}

fn foo(none) i32 {
    return false
}
