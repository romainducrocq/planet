pub fn main(none) i32 {
    x: i32 = 0
    if x ~= 0 {
        label return_y
        return y #  not declared
    }
    y: i32 = 4
    jump return_y
}
