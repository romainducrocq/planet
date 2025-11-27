#  Make sure we can propagate copies into Store instruction 

type struc s(    a: i32    , b: i32    
    )

pub glob: i32 = 0
pub i: i32 = 0
pub fn target(none) i32 {
    ptr: *i32 = @i
    glob = 30 #  this can be removed once we propagate its value

    ptr[] = glob #  rewrite as *ptr = 30, letting us remove
    #  previous write to glob

    glob = 10
    return ptr[]
}

pub fn main(none) i32 {
    if target() ~= 30 {
        return 1 #  failure
    }
    if glob ~= 10 {
        return 2 #  failure
    }
    return 0 #  success
}
