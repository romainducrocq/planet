#  compound assignment to struct members can be a dead store 

type struc s(    i: i32    )

pub glob_struct: struc s = $(15)
pub fn target(none) i32 {
    my_struct: struc s = $(4) #  dead (because compound assign below is dead too)
    my_struct.i /= 2 #  dead!
    my_struct = glob_struct
    return my_struct.i
}

pub fn main(none) i32 {
    return target()
}
