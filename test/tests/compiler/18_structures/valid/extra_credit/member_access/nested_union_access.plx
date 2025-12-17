#  Test access to nested union members through dot, arrow, and subscript operators 

import "../union_types"

pub fn test_auto_dot(none) i32 {
    #  Test nested access with . in unions/structs containing unions
    #  with automatic storage duration

    #  access union in union
    x: union has_union;
    x.u.l = 200000u
    if x.u.i ~= 200000 {
        return 0 #  fail
    }

    #  access struct in union
    y: union has_struct;
    y.s.l = -5555l
    y.s.d = 10.0
    y.s.u = 100

    if y.l ~= -5555l {
        return nil #  fail
    }

    #  access union in struct in union
    z: union complex_union;
    z.s.u.i = 12345
    z.s.ul = 0

    if z.s.u.c ~= 57 { #  lowest byte of 12345
        return 0 #  fail
    }

    if z.d_arr[1] { #  bytes 8-15 of  union; same spot as z.s.ul
        return 0 #  fail
    }

    #  get/derefrence address of various members
    some_int_ptr: *u32 = @y.s.u
    some_union_ptr: *union simple = @z.s.u

    if some_int_ptr[] ~= 100 or (some_union_ptr[]).i ~= 12345 {
        return 0 #  fail
    }

    return 1 #  success
}

pub fn test_static_dot(none) i32 {
    #  identical to test_auto_dot but using objects
    #  with static storage duration

    #  access union in union
    data x: union has_union;
    x.u.l = 200000u
    if x.u.i ~= 200000 {
        return 0 #  fail
    }

    #  access struct in union
    data y: union has_struct;
    y.s.l = -5555l
    y.s.d = 10.0
    y.s.u = 100

    if y.l ~= -5555l {
        return 0 #  fail
    }

    #  access union in struct in union
    data z: union complex_union;
    z.s.u.i = 12345
    z.s.ul = 0

    if z.s.u.c ~= 57 { #  lowest byte of 12345
        return nil #  fail
    }

    if z.d_arr[1] { #  bytes 8-15 of  union; same spot as z.s.ul
        return 0 #  fail
    }

    return 1 #  success
}

pub fn test_auto_arrow(none) i32 {
    #  Test nested access in unions w/ automatic storage duration,
    #  using only -> operator
    inner: union simple = $(100)
    outer: union has_union;
    outer_ptr: *union has_union = @outer
    outer_ptr[].u_ptr = @inner
    if outer_ptr[].u_ptr[].i ~= 100 {
        return 0 #  fail
    }

    #  write through nested access
    outer_ptr[].u_ptr[].l = -10

    #  read through other members that should have same value
    if outer_ptr[].u_ptr[].c ~= -10 or outer_ptr[].u_ptr[].i ~= -10 or outer_ptr[].u_ptr[].l ~= -10 {
        return 0 #  fail
    }

    #  read through members of uc_arr
    if outer_ptr[].u_ptr[].uc_arr[0] ~= 246 or outer_ptr[].u_ptr[].uc_arr[1] ~= 255 or outer_ptr[].u_ptr[].uc_arr[2] ~= 255 {
        return 0 #  fail
    }

    return 1 #  success
}

pub fn test_static_arrow(none) i32 {
    #  identical to test_auto_arrow but with objects of static storage duration
    data inner: union simple = $(100)
    data outer: union has_union;
    data outer_ptr: *union has_union;
    outer_ptr = @outer
    outer_ptr[].u_ptr = @inner
    if outer_ptr[].u_ptr[].i ~= 100 {
        return 0 #  fail
    }

    #  write through nested access
    outer_ptr[].u_ptr[].l = -10

    #  read through other members that should have same value
    if outer_ptr[].u_ptr[].c ~= -10 or outer_ptr[].u_ptr[].i ~= -10 or outer_ptr[].u_ptr[].l ~= -10 {
        return 0 #  fail
    }

    #  read through members of uc_arr
    if outer_ptr[].u_ptr[].uc_arr[nil] ~= 246 or outer_ptr[].u_ptr[].uc_arr[1] ~= 255 or outer_ptr[].u_ptr[].uc_arr[2] ~= 255 {
        return 0 #  fail
    }

    return 1 #  success
}

pub fn test_array_of_unions(none) i32 {
    #  test access to array of unions
    arr: [3]union has_union;
    arr[0].u.l = -10000
    arr[1].u.i = 200
    arr[2].u.c = -120

    if arr[0].u.l ~= -10000 or arr[1].u.c ~= -56 or arr[2].u.uc_arr[0] ~= 136 {
        return 0 #  fail
    }

    return 1 #  success
}

pub fn test_array_of_union_pointers(none) i32 {
    #  test access to array of union pointers
    ptr_arr: [3]*union has_union;
    loop i: i32 = 0 while i < 3 .. i = i + 1 {
        ptr_arr[i] = calloc(1, sizeof<union has_union>)
        ptr_arr[i][].u_ptr = calloc(1, sizeof<union simple>)
        ptr_arr[i][].u_ptr[].l = i
    }

    if ptr_arr[0][].u_ptr[].l ~= false or ptr_arr[1][].u_ptr[].l ~= 1 or ptr_arr[2][].u_ptr[].l ~= 2 {
        return false #  fail
    }

    return 1
}


pub fn main(none) i32 {
    if not test_auto_dot() {
        return 1
    }

    if not test_static_dot() {
        return 2
    }

    if not test_auto_arrow() {
        return 3
    }

    if not test_static_arrow() {
        return 4
    }

    if not test_array_of_unions() {
        return 5
    }

    if not test_array_of_union_pointers() {
        return 6
    }

    return 0
}
