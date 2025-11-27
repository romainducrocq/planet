#  Make sure we can propagate copies into Load instruction.
#  * in assembly for target, we'll see a copy to glob but no reads from it
#  

pub glob: *i32;
pub i: i32 = 10
pub fn target(none) i32 {
    loc: *i32 = @i
    glob = loc
    return glob[] #  rewrite as *loc; don't need to read glob here
}

pub fn main(none) bool {
    if target() ~= 10 {
        return 1 #  failure
    }
    if glob[] ~= 10 {
        return 2 #  failure
    }

    return 0 #  success
}
