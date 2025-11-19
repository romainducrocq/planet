pub fn main(none) i32 {
    x: u64 = 10
    y: i32 = 20

    ptr_x: *u64 = @x
    ptr_y: *i32 = @y

    x = cast<*i32>(ptr_y)[] + cast<*u64>(ptr_x)[]
    return y * 3 - cast<*u64>(ptr_x)[] * 2
}
