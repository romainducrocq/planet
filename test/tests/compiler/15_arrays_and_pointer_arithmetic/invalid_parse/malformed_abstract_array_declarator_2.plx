pub fn main(none) i32 {
    # pointer declarator can't follow array size declarator
    return cast<*i32[3]>(0)
}
