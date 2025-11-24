type struc s;

#  declare a function that takes param with incomplete struct type
pub fn foo(x: struc s) i32;

pub fn main(none) i32 {
    type struc s;
     #  declare a different incomplete struct type

    #  illegal declaration: this conflicts with earlier declaration of 'foo'
    #  becasue it has a different type (second 'struct s' instead of first)
    fn foo(x: struc s) i32;
    return 0
}
