# An initializer list must have at least one element
# NOTE: empty initializer lists are valid as of C23
pub fn main(none) i32 {
    arr: [1]i32 = $()
    return 0
}
