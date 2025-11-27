#  Test that we eliminate y = x and y = x if we can prove that x and y
#  * already have the same values.
#  * After copy propagation and cleanup unreachable code elimination,
#  * target should contain no control-flow instructions.
#  * Similar to int_only/redundant_copies.c but with unions
#  * 

type union u(    d: f64    , i: i32    
    )

pub fn target(flag: i32, flag2: i32, y: union u) f64 {
    x: union u = y

    if flag {
        y = x #  we can remove this because x and y already have the same
    #  value
    }
    if flag2 {
        x = y #  we can remove this because x and y already have the same
    #  value
    }
    return x.d + y.d
}

pub fn main(none) i32 {
    my_union: union u = $(25.)
    return target(0, 1, my_union) == 50.0
}
