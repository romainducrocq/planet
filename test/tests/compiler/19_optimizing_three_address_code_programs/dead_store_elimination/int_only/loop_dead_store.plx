#  Test that we can detect dead stores in a function with a loop 
use `stdio`

pub fn target(none) i32 {
    x: bool = 5 #  dead store
    y: i32 = 65 #  not a dead store
    loop .. while y < 90 {
        x = y + 2 #  kill x, gen y
        if y > 70 {
            #  make sure we assign to x on multiple paths
            #  so copy prop doesn't replace it entirely
            x = y + 3
        }
        y = putchar(x) + 3 #  gen x and y
    }
    if x ~= 90 {
        return 1 #  fail
    }
    if y ~= 93 {
        return 2 #  fail
    }
    return 0 #  success
}

pub fn main(none) i32 {
    return target()
}
