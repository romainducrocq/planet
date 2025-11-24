type struc pair(    a: i32    , b: i32    
    )

pub x: struc pair = $(1, 2)
type struc outer(
    d: f64    , inner: struc pair    
    )

#  you can't initialize an element in a static variable with a non-constant expression
pub y: struc outer = $(1.0, x)
