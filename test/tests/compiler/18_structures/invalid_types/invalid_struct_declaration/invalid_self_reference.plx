type struc s(    x: i32    #  a structure can't contain a member with its own type,
    #  because its type has not yet been completed.
    #  here, 'struct s' is still an incomplete type
    , y: struc s    
    )

pub fn main(none) i32 {
    return 0
}
