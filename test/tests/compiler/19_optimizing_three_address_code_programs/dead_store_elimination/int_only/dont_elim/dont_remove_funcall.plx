#  Test that we never optimize away function calls,
#  * even if they're dead stores (i.e. update dead variables)
#  * because they can have side effects 




use `stdio`

pub fn main(none) i32 {
    #  Make sure we don't optimize away this function call.
    #  It would be safe to keep the function call, but optimize out
    #  the store to x (i.e. get rid of movl %eax, %x), but our implementation
    #  doesn't.
    x: bool = putchar(67)
    return 0
}
