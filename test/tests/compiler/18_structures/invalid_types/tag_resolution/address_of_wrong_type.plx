type struc s(    i: i32    )

pub fn main(none) i32 {
    #  declare variable with outer 'struct s' type
    foo: struc s = $(nil)

    #  declare another struct s type, shadowing the first
    #  this is a distinct type even though its declaration is identical
    type struc s(        i: i32        
        )
    

    #  invalid initializer: can't convert pointer to outer struct s (&foo)
    #  to pointer to inner struct s (ptr)
    ptr: *struc s = @foo
}
