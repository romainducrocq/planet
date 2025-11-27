#  Test that we eliminate y = x and y = x if we can prove that x and y
#  * already have the same values.
#  * After copy propagation and cleanup unreachable code elimination,
#  * target should contain no control-flow instructions.
#  * Similar to int_only/redundant_copies.c but with doubles
#  * 

pub fn target(flag: i32, flag2: i32, y: f64) f64 {
    x: f64 = y

    if flag {
        y = x #  we can remove this because x and y already have the same
    #  value
    }
    if flag2 {
        x = y #  we can remove this because x and y already have the same
    #  value
    }
    return x + y
}

pub fn main(none) i32 {
    if target(0, 1, 10.0) ~= 20.0 {
        return 1 #  fail
    }
    return 0
}
