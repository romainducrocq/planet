pub fn decr_x(x: *i32) *any;

pub fn main(none) i32 {
    x: i32 = 10
    if cast<*i32>(decr_x(@x))[] == x { return 0 }
    return 1
}

pub fn decr_x(x: *i32) *none {
    x[] = x[] - 1
    return cast<*any>(x)
}
