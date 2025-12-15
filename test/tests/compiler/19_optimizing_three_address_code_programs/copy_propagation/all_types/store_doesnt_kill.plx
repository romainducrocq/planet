#  Test that updating a value through a pointer does not kill that pointer 
#  from standard library
use `stdlib`

pub fn check_pointers(a: i32, b: i32, ptr1: *i32, ptr2: *i32) none {
    if a ~= 100 or b ~= 101 {
        exit(1)
    }

    if ptr1[] ~= 60 or ptr2[] ~= 61 {
        exit(2)
    }
    return none
}

pub fn callee(p1: *i32, p2: *i32) i32 {
    if p1 ~= p2 {
        exit(3)
    }
    if p2[] ~= 10 {
        exit(4
            )
    }
    return 0 #  success
}

pub fn target(ptr: *i32, ptr2: *bool) i32 {
    #  first, call another function, with these arguments
    #  in different positions than in target or callee, so we can't
    #  coalesce them with the param-passing registers or each other
    check_pointers(100, 101, ptr, ptr2)

    ptr2 = ptr #  generate copy
    ptr[] = 10 #  Store(10, ptr) does NOT kill copy

    #  both arguments to callee should be the same
    return callee(ptr, ptr2)
}

pub fn main(none) i32 {
    x: i32 = 60
    y: i32 = 61
    return target(@x, @y)
}
