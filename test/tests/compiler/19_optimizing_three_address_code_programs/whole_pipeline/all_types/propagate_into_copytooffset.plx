#  Make sure we can propagate copies into CopyToOffset instruction 

type struc s(    a: i32    , b: i32    
    )

pub glob: i32 = 0

pub fn target(none) i32 {
    my_struct: struc s = $(1, 2)

    glob = 30 #  this can be removed once we propagate its value

    my_struct.b = glob #  rewrite as my_struct.b = 30, letting us remove
    #  previous write to glob

    glob =     10 #  glob is dead since we update it before returning from function
    return my_struct.b
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
