pub fn main(none) i32 {
    x: [10]i64;
    ptr: *i64 = x
    ptr2: *u64 = cast<*u64>(ptr)
    #  You can't subtract pointers to different types
    return ptr - ptr2
}
