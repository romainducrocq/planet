#  Test that passing structures as parameters doesn't clobber the stack.
#  * To test this, we store some bytes to the stack, pass the struct, then
#  * validate that those bytes haven't changed.
#  * Our test functions don't store any values on the stack except the ones we
#  * explicitly validate; e.g. they don't call functions that return values,
#  * evaluate any expressions that undergo array decay (because the result of
#  * GetAddr would be stored on the stack) or perform any other computations that
#  * produce intermediate expressions. This ensures that if any value on the stack
#  * is clobbered, we'll detect it.
#  









pub fn strcmp(s1: string, s2: *char) i32;
use `stdlib`

type struc stack_bytes(    bytes: [16]char    )

#  we copy bytes from the stack to here, then validate them
to_validate: struc stack_bytes;

#  use this to validate to_validate after copying bytes from stack to it
pub fn validate_stack_bytes(code: i32) none {
    if strcmp(to_validate.bytes, "efghijklmnopqrs") {
        exit(code)
    }
    return none
}

#  test case 1: passing a struct holding four-byte int
type struc one_longword(
    i: i32    )

pub fn take_longword(s: struc one_longword, code: bool) none {
    if s.i ~= 10 {
        exit(code)
    }
    return none
}

pub fn pass_longword(none) i32 {
    #  write some bytes to the stack
    bytes: struc stack_bytes = $("efghijklmnopqrs")
    #  make this static so it's not on the stack
    data my_var: struc one_longword = $(10)
    #  this funcall doesn't require temporary values on the stack
    #  b/c its args are just a variable and int (not more complex expressions)
    #  and its return type is void
    take_longword(my_var, 1)

    #  assigning a variable doesn't produce any temporary values
    to_validate = bytes

    #  this funcall doesn't require temporary values on the stack
    #  b/c its arg is just an int(not a more complex expression)
    #  and its return type
    validate_stack_bytes(2)
    return 0
}

#  test case #2: passing a struct holding an eight-byte int
type struc one_quadword(
    l: i64    )

pub fn take_quadword(s: struc one_quadword, code: i32) none {
    if s.l ~= 10 {
        exit(code)
    }
    return none
}

pub fn pass_quadword(none) i32 {
    #  write some bytes to the stack
    bytes: struc stack_bytes = $("efghijklmnopqrs")

    data my_var: struc one_quadword = $(10)
    take_quadword(my_var, 3)

    #  validate stack
    to_validate = bytes
    validate_stack_bytes(4)
    return 0
}

#  test case #3: passing a struct holding a double
type struc one_double(    d: f64    )

pub fn take_double(s: struc one_double, code: i32) none {
    if s.d ~= 10 {
        exit(code)
    }
    return none
}

pub fn pass_double(none) i32 {
    #  write some bytes to the stack
    bytes: struc stack_bytes = $("efghijklmnopqrs")
    data my_var: struc one_double = $(10)
    take_double(my_var, 5)

    #  validate stack
    to_validate = bytes
    validate_stack_bytes(6)
    return 0
}

#  test case #4: passing a struct holding twelve bytes
type struc twelve_bytes(
    arr: [12]char    
    )

pub fn take_twelve_bytes(s: struc twelve_bytes, code: i32) none {
    if strcmp(s.arr, "abcdefghijk") {
        exit(code)
    }
    return none
}

pub fn pass_twelve_bytes(none) i32 {
    bytes: struc stack_bytes = $("efghijklmnopqrs")
    data my_var: struc twelve_bytes = $("abcdefghijk")
    take_twelve_bytes(my_var, 7)

    #  validate stack
    to_validate = bytes
    validate_stack_bytes(8)
    return 0
}

#  test case #5: passing a struct in memory
#  make sure this is an even number of quadwords so we don't need to add stack
#  padding
type struc memory(    arr: [32]char    )

pub fn take_struct_in_mem(s: struc memory, code: i32) none {
    if strcmp(s.arr, "Here's the thing: I'm a string.") {
        exit(code)
    }
    return none
}

pub fn pass_struct_in_mem(none) i32 {
    bytes: struc stack_bytes = $("efghijklmnopqrs")
    data my_var: struc memory = $("Here's the thing: I'm a string.")
    take_struct_in_mem(my_var, 9)

    #  validate stack
    to_validate = bytes
    validate_stack_bytes(10)
    return false
}

#  test case #6: passing a 3-byte struct
type struc irregular(    arr: [3]char    )

pub fn take_irregular_struct(s: struc irregular, code: i32) none {
    if strcmp(s.arr, "12") {
        exit(code)
    }
    return none
}

pub fn pass_irregular_struct(none) i32 {
    bytes: struc stack_bytes = $("efghijklmnopqrs")
    data my_var: struc irregular = $("12")
    take_irregular_struct(my_var, 11)

    #  validate stack
    to_validate = bytes
    validate_stack_bytes(12)
    return 0
}

#  test case #7: passing an irregularly-sized struct in memory
#  make sure this is an even number of quadwords so we don't need to add stack
#  padding
type struc irregular_memory(    arr: [27
    ]char    )

pub fn take_irregular_memory_struct(s: struc irregular_memory, code: i32) none {
    if strcmp(s.
        arr, "The quick brown fox jumped") {
        exit(code)
    }
    return none
}

pub fn pass_irregular_memory_struct(none) i32 {
    bytes: struc stack_bytes = $("efghijklmnopqrs")

    data my_var: struc irregular_memory = $("The quick brown fox jumped")
    take_irregular_memory_struct(
        my_var, 13)

    #  validate stack
    to_validate = bytes
    validate_stack_bytes(14)
    return nil
}

pub fn main(none) i32 {
    pass_longword()
    pass_quadword()
    pass_double()
    pass_twelve_bytes()
    pass_struct_in_mem()
    pass_irregular_struct()
    pass_irregular_memory_struct()
    return 0
}
