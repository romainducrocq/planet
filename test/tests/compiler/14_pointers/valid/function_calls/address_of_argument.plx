#  Make sure we can take the address of function arguments,
#  * not just variables 

pub fn addr_of_arg(a: i32) i32 {
    ptr: *i32 = @a
    ptr[] = 10
    return a
}

pub fn main(none) i32 {
    #  the parameter a is an lvalue with an address,
    #  but the corresponding argument doesn't have to be
    result: i32 = addr_of_arg(-20)
    if result ~= 10 {
        return 1
    }

    #  try again with an lvalue; make sure original value doesn't change
    var: i32 = 100
    result = addr_of_arg(var)
    if result ~= 10 {
        return 2
    }
    if var ~= 100 {
        return 3
    }
    return 0
}
