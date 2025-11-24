type struc one(    x: i32    , y: i32    
    )

type struc two(    a: i32    
    , b: i32    
    )

pub fn return_struct(none) struc one {
    retval: struc two = $(1, 2)
    return retval #  can't return a "struct two" from function w/ return type "struct one"
}

pub fn main(none) i32 {
    return return_struct().x
}
