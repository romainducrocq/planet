pub a: i64;

pub fn main(none) i32 {
    #  This declaration refers to the global 'a' variable,
    #      * but has a conflicting type.
    #      
    extrn a: i32;
    return 0
}
