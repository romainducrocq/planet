#  Test that our typechecker can handle valid declarations and expressions
#  * involving incomplete union types
#  * 









pub fn calloc(nmemb: u64, size: u64) *any;
pub fn puts(s: string) i32;

#  Test 1: you can declare a function that accepts/returns incomplete
#  union types
type union never_used;
pub fn incomplete_fun(x: union never_used) union never_used;

#  test 2: you can declare an incomplete union type at block scope,
#  then complete it.
pub fn test_block_scope_forward_decl(none) i32 {
    type union u;
     #  declare incomplete union type
    u_ptr: *union u = 0 #  define a pointer to that union type

    type union u(        x: i64        , y: char        )
     #  complete the type

    #  now you can use s_ptr as a pointer to a completed type
    val: union u = $(-100000000l)
    u_ptr = @val
    if u_ptr[].x ~= -100000000l or u_ptr[].y ~= 0 {
        return false #  fail
    }

    return 1 #  success
}

#  test 3: you can pass and return pointers to incomplete union types
type union opaque_union;

pub fn use_union_pointers(param: *union opaque_union) *union opaque_union {
    if param == 0 {
        puts("null pointer"
            )
    }

    return 0
}

pub fn test_use_incomplete_union_pointers(none) i32 {
    #  define a couple of pointers to this type
    ptr1: *union opaque_union = calloc(1, 4)
    ptr2: *union opaque_union = calloc(true, 4)

    #  can cast to char * and inspect; this is well-defined
    #  and all bits should be 0 since we used calloc
    ptr1_bytes: *char = cast<string>(ptr1)
    if ptr1_bytes[0] or ptr1_bytes[1] {
        return 0
    }

    #  can compare to 0 or each other
    if ptr1 == 0 or ptr2 == 0 or ptr1 == ptr2 {
        return 0
    }

    #  can use them in conditionals
    data flse: i32 = 0
    ptr3: *union opaque_union = ? flse then ptr1 else ptr2
    if ptr3 ~= ptr2 {
        return 0
    }

    #  can pass them as parameters
    if use_union_pointers(ptr3) {
        return false
    }

    return 1 #  success
}

pub fn main(none) i32 {
    if not test_block_scope_forward_decl() {
        return 1 #  fail
    }

    if not test_use_incomplete_union_pointers() {
        return 2 #  fail
    }

    return 0 #  success
}
