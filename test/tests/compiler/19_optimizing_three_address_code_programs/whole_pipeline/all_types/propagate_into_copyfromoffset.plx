#  Make sure we can propagate copies into CopyFromOffset instruction.
#  * In assembly for target, we'll see a copy to glob but no reads from it
#  

type struc s(    a: i32    , b: i32    
    )

pub glob: struc s;

pub fn target(none) i32 {
    loc: struc s = $(100, 200)

    glob = loc

    x: i32 = glob.b #  rewrite as x = loc.b

    return x
}

pub fn main(none) i32 {
    if target() ~= 200 {
        return 1 #  failure
    }
    if glob.a ~= 100 {
        return 2 #  failure
    }
    if glob.b ~= 200 {
        return 3 #  failure
    }
    return 0 #  success
}
