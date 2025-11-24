pub fn main(none) i32 {
    type struc s(        i: i32        
        )
    
    struct1: struc s = $(1)

    {
        type struc s(            i: i32            )
        
        struct2: struc s = $(2)

        #  invalid conditional expression: struct1 and struct2 have different
        #  types
        cast<none>((? true then struct1 else struct2))
    }
}
