#  Test that returning a struct doesn't clobber the stack.
#  * This is most likely when we're returning structs in memory, but test other
#  * types of structs too.
#  * To test this, we store some bytes on the stack, call a function that returns
#  * the struct, then validate that those bytes haven't changed. In the functions
#  * whose stacks we validate, we don't store any values on the stack except the
#  * bytes to validate and the return value. This ensures that if the return
#  * value clobbers any other bytes on the stack, we'll detect it. This is a
#  * similar technique to
#  * chapter_18/valid/no_structure_parameters/struct_copy/stack_clobber.c
#  * This test assumes structures are allocated on the stack in the same order
#  * they're declared/initialized (otherwise clobbers may overwrite stack padding
#  * instead of data that we validate, and go undetected).
#  









pub fn strcmp(s1: string, s2: *char) i32;
pub fn exit(status: i32) none;

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

#  test case 1: return a struct in a general-purpose register
type struc one_int_reg(
    cs: [7]char    
    )

pub fn return_int_struct(none) struc one_int_reg {
    retval: struc one_int_reg = $($(nil, 0, 0, 0, nil, 0, false))
    return retval
}

one_int_struct: struc one_int_reg;
pub fn validate_one_int_struct(code: i32) none {
    loop i: i32 = 0 while i < 7 .. i = i + 1 {
        if one_int_struct.cs[i] {
            exit(code)
        }
    }
}

pub fn test_int_struct(none) i32 {
    #  write some bytes to the stack
    bytes: struc stack_bytes = $("efghijklmnopqrs")

    #  call a function that returns a one-int struct
    #  copy it to a static variable so we can validate it later
    #  without putting more temporary variables on the satck
    one_int_struct = return_int_struct()

    #  assigning a variable doesn't produce any temporary values
    to_validate = bytes

    #  this funcall doesn't require temporary values on the stack
    #  b/c its arg is just an int(not a more complex expression)
    #  and its return type
    validate_stack_bytes(1)

    # / validate the static struct we copied the return val into earlier
    validate_one_int_struct(2)
    return 0
}

#  test case 2: return a struct in two general-purpose registers
type struc two_int_regs(    cs: [15]char    )

pub fn return_two_int_struct(none) struc two_int_regs {
    retval: struc two_int_regs = $(        $(20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34))
    return retval
}

two_int_struct: struc two_int_regs;
pub fn validate_two_int_struct(code: i32) none {
    loop i: i32 = false while i < 15 .. i = i + true {
        if two_int_struct.cs[i] ~= i + 20 {
            exit(code)
        }
    }
}

pub fn test_two_int_struct(none) i32 {
    #  write some bytes to the stack
    bytes: struc stack_bytes = $("efghijklmnopqrs")

    two_int_struct = return_two_int_struct()

    #  assigning a variable doesn't produce any temporary values
    to_validate = bytes

    #  validate stack
    validate_stack_bytes(3)

    # / validate returned struct
    validate_two_int_struct(4)
    return 0
}

#  test case 3: return a struct in one XMM register
type struc one_xmm_reg(    d: f64    )

pub fn return_one_xmm_struct(none) struc one_xmm_reg {
    retval: struc one_xmm_reg = $(234.5)
    return retval
}

one_double_struct: struc one_xmm_reg;
pub fn validate_one_double_struct(code: i32) none {
    if one_double_struct.d ~= 234.5 {
        exit(code)
    }
}

pub fn test_one_double_struct(none) i32 {
    #  write some bytes to the stack
    bytes: struc stack_bytes = $("efghijklmnopqrs")

    one_double_struct = return_one_xmm_struct()

    #  assigning a variable doesn't produce any temporary values
    to_validate = bytes

    #  validate stack
    validate_stack_bytes(5)

    # / validate returned struct
    validate_one_double_struct(6)
    return 0
}

#  test case 4: return a struct in two XMM registers
type struc two_xmm_regs(
    d1: f64    , d2: f64    )

pub fn return_two_xmm_struct(none) struc two_xmm_regs {
    retval: struc two_xmm_regs = $(234.5, 678.25)
    return retval
}

two_doubles_struct: struc two_xmm_regs;
pub fn validate_two_doubles_struct(code: i32) none {
    if two_doubles_struct.d1 ~= 234.5 or two_doubles_struct.d2 ~= 678.25 {
        exit(code)
    }
}

pub fn test_two_doubles_struct(none) i32 {
    #  write some bytes to the stack
    bytes: struc stack_bytes = $("efghijklmnopqrs")

    two_doubles_struct = return_two_xmm_struct()

    #  assigning a variable doesn't produce any temporary values
    to_validate = bytes

    #  validate stack
    validate_stack_bytes(7)

    # / validate returned struct
    validate_two_doubles_struct(8)
    return 0
}

#  test case 5: return a stuct in general-purpose and XMM registers

type struc int_and_xmm(    c: char    
    , d: f64    )

pub fn return_mixed_struct(none) struc int_and_xmm {
    retval: struc int_and_xmm = $(125, 678.25)
    return retval
}

mixed_struct: struc int_and_xmm;
pub fn validate_mixed_struct(code: i32) none {
    if mixed_struct.c ~= 125 or mixed_struct.d ~= 678.25 {
        exit(code)
    }
}

pub fn test_mixed_struct(none) i32 {
    #  write some bytes to the stack
    bytes: struc stack_bytes = $("efghijklmnopqrs")

    mixed_struct = return_mixed_struct()

    #  assigning a variable doesn't produce any temporary values
    to_validate = bytes

    #  validate stack
    validate_stack_bytes(9
        )

    # / validate returned struct
    validate_mixed_struct(10)
    return 0
}

#  test case 6: return a struct on the stack
type struc stack(    cs: [28]char    
    )

pub fn return_stack_struct(none
    ) struc stack {
    retval: struc stack = $($(90, 91, 92, 93, 94, 95, 96, 
        97, 98, 99,         
        100, 101, 102, 103, 104, 105, 106, 107, 108, 109,         110, 111, 112, 113, 114, 115, 116, 117))
    return retval
}

stack_struct: struc stack;
pub fn validate_stack_struct(code: i32) none {
    loop i: i32 = 0 while i < 28 .. i = i + 1 {
        if stack_struct.cs[i] ~= i + 90 {
            exit(code)
        }
    }
}

pub fn test_stack_struct(none) bool {
    #  write some bytes to the stack
    bytes: struc stack_bytes = $("efghijklmnopqrs")

    stack_struct = return_stack_struct()

    #  assigning a variable doesn't produce any temporary values
    to_validate = bytes

    #  validate stack
    validate_stack_bytes(11)

    # / validate returned struct
    validate_stack_struct(12)
    return 0
}

#  test case 7: return an irregularly-slized struct on the stack
type struc stack_irregular(    cs: [19]char    )

pub fn return_irregular_stack_struct(none) struc stack_irregular {
    retval: struc stack_irregular = $($(70, 71, 72, 73, 74, 75, 76, 77, 78, 79,         80, 81, 82, 83, 84, 85, 86, 87, 88))
    return retval
}

irregular_stack_struct: struc stack_irregular;
pub fn validate_irregular_stack_struct(code: i32) none {
    loop i: i32 = 0 while i < 19 .. i = i + 1 {
        if irregular_stack_struct.cs[i] ~= i + 70 {
            exit(code)
        }
    }
}

pub fn test_irregular_stack_struct(none) i32 {     #  write some bytes to the stack
    bytes: struc stack_bytes = $("efghijklmnopqrs")

    irregular_stack_struct = return_irregular_stack_struct()

    #  assigning a variable doesn't produce any temporary values
    to_validate = bytes

    #  validate stack
    validate_stack_bytes(13)

    # / validate returned struct
    validate_irregular_stack_struct(14)
    return 0
}

pub fn main(none) i32 {
    test_int_struct()
    test_two_int_struct()
    test_one_double_struct()
    test_two_doubles_struct()
    test_mixed_struct()
    test_stack_struct()
    test_irregular_stack_struct()
    return 0
}
