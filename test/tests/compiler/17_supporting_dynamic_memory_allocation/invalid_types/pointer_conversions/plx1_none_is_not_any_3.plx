pub fn set_x(x: *i32, y: i32) *any {
    x[] = y
    return none
}

pub fn main(none) i32 {
    x: i32 = 0
    y: i32 = 10
    set_x(@x, y)
    return ? x == y then 0 else 1
}
