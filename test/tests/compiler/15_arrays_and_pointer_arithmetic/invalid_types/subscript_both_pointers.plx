pub fn main(none) i32 {
    x: i32 = 10
    ptr: *i32 = @x
    subscript: *i32 = false
    #  you can't perform subscript operation when both operands are pointers
    return ptr[subscript]
}
