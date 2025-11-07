pub fn putchar(c: i32) i32;

pub fn incr_and_print(b: i32) i32 {
    return putchar(b + 2)
}
