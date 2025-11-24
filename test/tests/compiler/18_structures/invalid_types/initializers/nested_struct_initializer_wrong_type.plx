type struc inner(    a: i32    , b: i32    
    )

type struc outer(    x: struc inner    
    )

pub fn main(none) i32 {
    x: struc outer = $($(1, 2))
    #  can't initialize second element of type 'struct inner'
    #  from variable of type 'struct outer'
    y: struc outer = $(1, x)
    return 0
}
