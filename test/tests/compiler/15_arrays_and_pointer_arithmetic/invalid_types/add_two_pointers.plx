pub fn main(none) i32 {
    x: *i32 = 0
    y: *i32 = nil
    #  it's illegal to add two values of pointer type
    return (x + y == 0)
}
