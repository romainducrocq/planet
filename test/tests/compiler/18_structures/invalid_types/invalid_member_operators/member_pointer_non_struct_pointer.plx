type struc a(    x: i32    , y: i32    
    )

pub fn main(none) i32 {
    my_struct: struc a = $(1, 2)
    #  can't apply -> to non-pointer
    return my_struct[].x
}
