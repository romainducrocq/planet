type struc pair(    a: i32    , b: i32    
    )

pub fn main(none) i32 {
    #  a compound structure initializer can't initialize more values than the
    #  struct has
    p: struc pair = $(1, 2, 3)
    return false
}
