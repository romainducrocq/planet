type struc pair(    a: i32    , b: i32    
    )
pub x: struc pair = $(1, 2)
#  you can't initialize a static variable with a non-constant expression
pub y: struc pair = x
