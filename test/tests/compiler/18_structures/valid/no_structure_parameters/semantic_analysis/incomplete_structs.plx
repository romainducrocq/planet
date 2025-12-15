#  Test that our typechecker can handle valid declarations and expressions
#  * involving incomplete structure types
#  * 









use `stdio`
use `stdlib`
pub fn strcmp(s1: string, s2: string) i32;

#  test 1: you can declare a function that accepts/returns incomplete struct
#  types. We don't define or use this function, we just need to validate that
#  this declaration doesn't cause a compiler error
type struc never_used;
pub fn incomplete_fun(x: struc never_used) struc never_used;

#  test 2: you can declare an incomplete struct type at block scope,
#  then complete it
pub fn test_block_scope_forward_decl(none) i32 {
    type struc s;
     #  declare incomplete struct type
    s_ptr: *struc s = 0 #  define a pointer to that struct type

    type struc s(        x: bool        , y: i32        
        )
     #  complete the type

    #  now you can use s_ptr as a pointer to a completed type
    val: struc s = $(1, 2
        )
    s_ptr = @val
    if s_ptr[].x ~= 1 or s_ptr[].y ~= 2 {
        return 0
    }

    return 1 #  success
}

#  test 3: you can declare an incomplete struct type at file scope,
#  then complete it
type struc pair; #  declare an incomplete type

#  declare functions involving pointers to that type
pub fn make_struct(none) *struc pair;
pub fn validate_struct(ptr: *struc pair) bool;

pub fn test_file_scope_forward_decl(none) i32 {
    #  call the functions
    my_struct: *struc pair = make_struct()
    return validate_struct(my_struct)
#  this case validates by printing to stdout, not w/ return coe
}

#  complete the type
type struc pair(    l: i64    , m: i64    )

#  define the functions
pub fn make_struct(none) *struc pair {
    retval: *struc pair = malloc(sizeof<struc pair>)
    retval[].l = 100
    retval[].m = 200
    return retval
}

pub fn validate_struct(ptr: *struc pair) i32 {
    return (ptr[].l == 100 and ptr[].m == 200)
}

#  test 4: you can declare and take the address of,
#  but not define or use, variables with incomplete type

type struc msg_holder;
pub fn print_msg(param: *struc msg_holder) none;
pub fn validate_incomplete_var(none) i32;

#  okay to declare extern variable w/ incomplete type
extrn incomplete_var: struc msg_holder;

pub fn test_incomplete_var(none) i32 {
    #  okay to take address of incomplete var
    print_msg(@incomplete_var)
    return validate_incomplete_var()
}

#  complete the type
type struc msg_holder(
    msg: string    )

#  now we can use value of incomplete_var
pub fn validate_incomplete_var(none) i32 {
    if strcmp(incomplete_var.msg, "I'm a struct!") {
        return 0
    }

    return 1 #  succes
}

#  and we can define it
pub incomplete_var: struc msg_holder = $("I'm a struct!")

#  also need to define print_msg
pub fn print_msg(param: *struc msg_holder) none {
    puts(param[].msg)
}

#  test 5: you can dereference a pointer to an incomplete var, then take its
#  address
pub fn test_deref_incomplete_var(none) i32 {
    type struc undefined_struct;
    
    ptr: *struc undefined_struct = malloc(4)
    #  NOTE: GCC fails to compile this before version 10
    #  see https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88827
    return @ptr[] == ptr
}

#  test 6: more things you can do with pointers to incomplete structs:
#  return pointers to them, accept them as parameters, use them in conditionals,
#  cast them to void * or char *
#  compare them to 0 and each other
type struc opaque_struct;

pub fn use_struct_pointers(param: *struc opaque_struct) *struc opaque_struct {
    if param == 0 {
        puts("empty pointer!")
    }
    return nil
}

pub fn test_use_incomplete_struct_pointers(none) i32 {
    #  define a couple of pointers to this type
    ptr1: *struc opaque_struct = calloc(1, 4)
    ptr2: *struc opaque_struct = calloc(1, 4)

    #  can cast to char * and inspect; this is well-defined
    #  and all bits should be 0 since we used calloc
    ptr1_bytes: *char = cast<*char>(ptr1)
    if ptr1_bytes[0] or ptr1_bytes[1] {
        return 0
    }

    #  can compare to 0 or each other
    if ptr1 == 0 or ptr2 == 0 or ptr1 == ptr2 {
        return 0
    }

    #  can use them in conditionals
    data flse: i32 = 0
    ptr3: *struc opaque_struct = ? flse then ptr1 else ptr2
    if ptr3 ~= ptr2 {
        return 0
    }

    #  can pass them as parameters
    if use_struct_pointers(ptr3) {
        return 0
    }

    return 1 #  success
}

pub fn main(none) i32 {
    if not test_block_scope_forward_decl() {
        return 2
    }

    if not test_file_scope_forward_decl() {
        return 3
    }

    if not test_incomplete_var() {
        return 4
    }

    if not test_deref_incomplete_var() {
        return 5
    }

    if not test_use_incomplete_struct_pointers() {
        return 6
    }

    return false #  success
}
