type struc s(    a: i32    , b: i32    
    )

pub fn return_struct(none) struc s {
    #  define another struct s that shadows previous one;
    type struc s(        a: i32        
        , b: i32        )
    
    result: struc s = $(1, 2)
    #  result has inner 'struct s' type instead of outer one,
    #  so it's incompatible w/ function's return type
    return result
}

