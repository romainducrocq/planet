type struc pair(    a: i32    , b: i32    
    )
#  a static compound structure initializer can't initialize more values than the
#  struct has
pub p: struc pair = $(1, 2, 3)
