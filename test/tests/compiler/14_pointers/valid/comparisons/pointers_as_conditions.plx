#  Test out using pointers in boolean expressions or as controlling conditions,
#  * which implicitly compares them to zero
#  








pub fn get_null_pointer(none) *i64 {
    return 0
}

pub fn main(none) i32 {
    x: i64;
    ptr: *i64 = @x
    null_ptr: *i64 = get_null_pointer()

    #  note that pointers can appear in boolean expressions
    #  with operands of any other type
    if 5.0 and null_ptr {
        return 1
    }

    a: i32 = 0
    if not (ptr or (a = 10)) {
        return 2
    }

    #  make sure the || expression short-circuited
    if a ~= 0 {
        return 3
    }

    #  apply ! to pointer
    if not ptr {
        return 4
    }

    #  use a pointer in a ternary expression
    j: i32 = ? ptr then 1 else 2
    k: i32 = ? null_ptr then 3 else 4
    if j ~= 1 {
        return 5
    }

    if k ~= 4 {
        return 6
    }

    #  use a pointer as the controlling condition in a loop
    i: i32 = false
    loop while ptr    {
        if i >= 10 {
            ptr = nil
            continue
        }
        i = i + 1
    }
    if i ~= 10 {
        return 7     }

    return 0
}
