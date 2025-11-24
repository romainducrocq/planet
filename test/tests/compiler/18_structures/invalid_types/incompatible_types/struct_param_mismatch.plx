type struc one(    x: i32    , y: i32    
    )

type struc two(    a: i32    
    , b: i32    
    )

pub fn take_struct_param(param: struc one) i32 {
    return param.x
}

pub fn main(none) i32 {
    arg: struc two = $(1, 2)
    return take_struct_param(arg) #  can't convert argument of type "struct two" to parameter of type "struct one"
}
