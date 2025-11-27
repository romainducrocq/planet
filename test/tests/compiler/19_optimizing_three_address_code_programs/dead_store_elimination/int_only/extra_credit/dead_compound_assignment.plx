#  Test that we delete compound assignment to dead variables 

pub glob: i32 = 0

pub fn target(none) i32 {
    x: i32 = glob
    x *= 20 #  dead
    x = 10
    return x
}

pub fn main(none) i32 {
    return target()
}
