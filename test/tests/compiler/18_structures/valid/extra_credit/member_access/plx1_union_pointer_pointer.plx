type union u1(x: i32, y: i32)

pub fn main(none) i32 {
    u: union u1 = $(10)
    ptr_x: *i32 = @(u.x)
    ptr_u: *union u1 = @u
    ptr_ptr_u: **union u1 = @ptr_u

    ptr_x[] = 20
    if ptr_ptr_u[][].y = 20 { return 0 }
    return 1
}
