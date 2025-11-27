#  Test that we eliminate y = x and y = x if we can prove that x and y
#  * already have the same values.
#  * After copy propagation and cleanup unreachable code elimination,
#  * target should contain no control-flow instructions.
#  * Similar to int_only/redundant_copies.c but with structs
#  * 

type struc s(    d: f64    , i: i32    
    )

pub fn target(flag: i32, flag2: i32, y: struc s) f64 {
    x: struc s = y

    if flag {
        y = x #  we can remove this because x and y already have the same
    #  value
    }
    if flag2 {
        x = y #  we can remove this because x and y already have the same
    #  value
    }
    return x.d + y.d + x.i + y.i
}

pub fn main(none) i32 {
    my_struct: struc s = $(25.0, 5)
    return target(false, true, my_struct) == 60.0
}
