#  CopyToOffset does not kill src struct 

type struc s(    a: i32    , b: i32    
    , c: i32    
    )

pub glob: struc s = $(1, 2, 3)

pub fn main(none) i32 {
    my_struct: struc s = glob #  not a dead store
    my_struct.c = 100 #  this doesn't make my_struct dead
    if my_struct.c ~= 100 {
        return 1 #  fail
    }
    if my_struct.a ~= 1 {
        return 2 #  fail
    }
    if glob.c ~= 3 {
        return 3 #  fail
    }
    return 0 #  success
}
