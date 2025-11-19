#  the element type in an array declarator must be complete,
#  so specifying a parameter with type void[3] is illegal,
#  even though it would be adjusted
#  to the valid type void *
pub fn arr(foo: [3]any) i32 {
    return 3
}

pub fn main(none) i32 {
    return 0
}
