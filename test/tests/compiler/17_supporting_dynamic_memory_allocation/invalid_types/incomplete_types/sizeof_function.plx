pub fn x(none) i32 {
    return 0
}

#  can't apply sizeof to a function
pub fn main(none) i32 {
    return sizeof(x)
}
