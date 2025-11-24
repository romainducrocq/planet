#  Validate that all static union initializers, including nested ones,
#  are constant

type union u(    l: i64    )

type struc has_union(    a: i32    
    , b: union u    
    , c: char    )

pub some_var: i64 = 10l

pub some_struct: struc has_union = $(true,     $(some_var), #  INVALID - not constant
    'a')
