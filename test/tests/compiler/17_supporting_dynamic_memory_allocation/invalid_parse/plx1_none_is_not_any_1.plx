pub fn incr_x(x: *i32) none; 

pub fn main(none) i32 {
    x: i32 = -1
    incr_x(@x)
    return x
}

pub fn incr_x(x: *i32) any {
    x[] = x[] + 1
}
