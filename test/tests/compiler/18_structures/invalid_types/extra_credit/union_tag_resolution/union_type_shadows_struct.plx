#  Test that we correctly track unions shadowing structs w/ same tag

#  define a struct type
type struc u(    a: i32    )

pub fn main(none) i32 {
    #  declare an incomplete union type shadowing earlier complete type
    type union u;
    
    my_union: union u; #  invalid - type is incomplete
    return nil
}
