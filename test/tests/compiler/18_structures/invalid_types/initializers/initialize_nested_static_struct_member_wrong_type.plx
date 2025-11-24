type struc s(    d: f64    , arr: [3]*any    
    )

#  can't initialize a nested element of type void * with a constant of type double
pub x: struc s = $(0.0, $(1.0))
