pub fn main(none) i32 {
    #  These two declarations conflict;
    #      * they declare the same identifier in the same
    #      * scope, but they don't refer to the same object,
    #      * since neither one has linkage.
    #      
    x: i32 = 1
    data x: i32;
    return x
}
