type struc s;

#  declare a function that takes param with incomplete struct type
pub fn foo(x: struc s) i32;

pub fn main(none) i32 {
    type union s;
     #  declare an incomplete union type w/ same tag

    #  illegal declaration: this conflicts with earlier declaration of 'foo'
    #  becasue it has a different type ( 'union s' instead of 'struct s')
    fn foo(x: union s) i32;
    return 0
}
