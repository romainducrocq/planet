pub fn main(none) i32 {
    #  Nested function definitions are not permitted 
    fn foo(none) i32 {
        return 1
    }
    
    return foo()
}
