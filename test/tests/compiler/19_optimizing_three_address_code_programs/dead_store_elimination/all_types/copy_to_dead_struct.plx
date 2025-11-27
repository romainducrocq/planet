#  Dead store elimination can also eliminate copies to struct members. 
type struc s(    i: i32    )

pub fn f(arg: struc s) i32 {
    return arg.i
}

pub fn target(none) i32 {
    my_struct: struc s = $(4)
    x: i32 = f(my_struct)
    my_struct.i = 10 #  dead!
    return x
}

pub fn main(none) i32 {
    return target()
}
