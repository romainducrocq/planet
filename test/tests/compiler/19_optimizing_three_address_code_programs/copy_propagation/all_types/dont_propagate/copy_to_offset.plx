#  Test that CopyToOffset kills its destination 
type struc s(    x: i32    , y: i32    
    )

pub fn main(none) i32 {
    data s1: struc s = $(1, 2)
    s2: struc s = $(3, 4)
    s1 = s2 #  generate s1 = s2
    s2.x = 5 #  kill s1 = s2

    return s1.x #  make sure we don't propagate s2 into this return statement
}
