#  Redeclaring a union that was already defined in the current scope has no effect
pub fn main(none) i32 {
    type union u(        a: i32        
        )
    

    type union u;
     #  this does nothing

    my_union: union u = $(1)
    return my_union.a
}
