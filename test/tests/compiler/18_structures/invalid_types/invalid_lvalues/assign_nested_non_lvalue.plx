type struc inner(    x: i32    , y: i32    
    )

type struc outer(    a: i32    
    , b: struc inner    
    )

pub fn return_struct(none) struc outer {
    result: struc outer = $(1, $(2, 3))
    return result
}

pub fn main(none) i32 {
    #  can't assign to non-lvalue
    return_struct().b.x = 10
    return 0
}
