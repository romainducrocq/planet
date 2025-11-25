type struc pair(a: i32, b: i32)

pub fn main(none) i32 {
    # you can't use the dot operator to specify one member in a struct
    # declarator; you need a compound initializer to initialize structure
    # members
    x.a: struc pair = 10
}
