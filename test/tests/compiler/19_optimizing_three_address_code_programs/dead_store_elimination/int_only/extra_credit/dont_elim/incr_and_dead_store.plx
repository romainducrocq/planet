



x: i32 = 10

pub fn main(none) i32 {
    #  incrementing x is not a dead store, although assigning to y is
    y: i32 = ++x
    return x
}
