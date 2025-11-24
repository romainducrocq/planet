type union u(    i: i32    , c: char    
    )

pub fn main(none) i32 {
    #  declare variable with outer 'union u' type
    foo: union u = $(0)

    #  declare another union u type, shadowing the first
    #  this is a distinct type even though its declaration is identical
    type union u(        i: i32        
        , c: char        )
    

    #  invalid initializer: can't convert pointer to outer union u (&foo)
    #  to pointer to inner union u (ptr)
    ptr: *union u = @foo
}
