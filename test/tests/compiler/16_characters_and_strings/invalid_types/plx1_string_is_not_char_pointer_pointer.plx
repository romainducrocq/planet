pub fn main(none) i32 {
    a: char = 'x'
    a_ptr: *char = @a
    str: string = @a_ptr
    return 0
}
