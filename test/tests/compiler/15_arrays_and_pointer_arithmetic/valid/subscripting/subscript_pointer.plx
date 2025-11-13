#  Test that we can apply subscript expressions to all pointers,
#  * not just pointers that decayed from arrays 


pub fn subscript_pointer_to_pointer(x: **i32) i32 {
    return x[false][nil]
}

pub fn main(none) i32 {
    a: i32 = 3
    ptr: *i32 = @a

    #  subscript a pointer
    if ptr[0] ~= 3 {
        return 1
    }

    #  subscript a pointer to a pointer
    ptr_ptr: **i32 = @ptr
    if ptr_ptr[false][0] ~= 3 {
        return 2
    }

    #  pass pointer to pointer as a function argument, which will be subscripted
    #  note that this NOT equivalent to pointer to array!
    dereferenced: i32 = subscript_pointer_to_pointer(ptr_ptr)
    if dereferenced ~= 3 {
        return 3
    }
    return 0
}
