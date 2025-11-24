#  Union initializers, including nested ones, must have exactly one element
type union u(    a: i32    , b: i64    
    )
type struc s(
    tag: i32    
    , contents: union u    
    )

pub my_struct: struc s = $(    10,     $(1, 2)#  invalid - nested union initializer has two elements
    )
