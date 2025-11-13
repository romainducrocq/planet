pub fn main(none) i32 {
    # invalid abstract declarator syntax: pointer declarator can't follow
    # array size declarator
    return cast<[3]i32*>(0)
}
