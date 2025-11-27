#  Reading a sub-object within a union makes the whole union live 

type struc s(    a: i32    , b: i32    
    )

type union u(    str: struc s    
    , l: i64    )

pub glob: union u = $($(1, 2))

pub fn main(none) i32 {
    my_union: union u;
    my_union = glob #  not a dead store b/c we access a member
    return my_union.str.a
}
