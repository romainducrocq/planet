type struc s;

#  declare a function that returns the incomplete structure type 'struct s'
pub fn foo(none) struc s;

pub fn main(none) i32 {
    type struc s;
     #  declare a distinct incomplete struct type

    #  illegal declaration: this conflicts w/ earlier declaration of foo
    #  becaues it has a different return type (inner instead of outer 'struct
    #  s')
    fn foo(none) struc s;
    return nil
}
