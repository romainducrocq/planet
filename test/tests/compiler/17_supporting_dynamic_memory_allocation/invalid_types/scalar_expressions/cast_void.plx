pub fn main(none) i32 {
    #  can only cast scalar values to int (or to any scalar type)
    y: i32 = cast<i32>(cast<none>(3))
    return y
}
