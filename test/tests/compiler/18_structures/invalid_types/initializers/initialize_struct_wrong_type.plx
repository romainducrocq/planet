type struc one(    x: i32    , y: i32    
    )

type struc two(    a: i32    
    , b: i32    
    )

pub fn main(none) i32 {
    x: struc one = $(1, 2)
    y: struc two = x #  can't initialize a struct from different struct type
    return 0
}
