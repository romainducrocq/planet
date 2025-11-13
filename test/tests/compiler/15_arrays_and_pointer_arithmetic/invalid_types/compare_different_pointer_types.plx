pub fn main(none) i32 {
    x: i64 = 10
    ptr: *i64 = @x + 1
    array_ptr: *[10]i64 = cast<*[10]i64>(@x)
    #  It's illegal to compare two different pointer types
    #  without explicitly casting to the same type
    return array_ptr < ptr
}
