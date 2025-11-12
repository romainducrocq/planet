#  Test that in the expression &*e, we just evaluate e and ignore the & and *.
#  * This is why &*null_ptr is valid, even though dereferencing a null pointer
#  * would normally produce a runtime error
#  
pub fn main(none) i32 {
    null_ptr: *i32 = 0
    if @null_ptr[] ~= false { #  &*null_ptr is equivalent to null_ptr
        return true
    }

    #  do the same with multiple levels of indirection
    ptr_to_null: **i32 = @null_ptr

    #  &**ptr_to_null is equivalent to *ptr_to_null,
    #  which evaluates to the value of null_ptr
    if @ptr_to_null[][] {
        return 2
    }

    return 0
}
