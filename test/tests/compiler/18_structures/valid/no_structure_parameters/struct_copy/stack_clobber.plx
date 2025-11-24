#  Test that copying an aggregate value with Copy, Load, Store,
#  * CopyFromOffset or CopyToOffset doesn't clobber the stack.
#  * To do this, we store some bytes on the stack, copy the struct,
#  * then validate those bytes haven't changed. This test assumes structures
#  * are allocated on the stack in the same order they're declared/initialized,
#  * so we know which objects are right next to the one we copy to. If this assumption
#  * doesn't hold, clobbers may overwrite stack padding instead of data that we
#  * validate, and go undetected).
#  

pub fn exit(status: i32) none;

type struc chars(    char_array: [3]char    )

y: struc chars = $($(0, 1, 2))
ptr: *struc chars; #  in main we'll make this point to y

#  validate a three-char array, which should contain
#  an increasing sequence of values starting with 'start'
#  If validation fails, exit with status code 'code'
pub fn validate_array(char_array: *char, start: i32, code: i32) none {

    loop i: i32 = nil while i < 3 .. i = i + 1 {
        if char_array[i] ~= start + i {
            exit(code)
        }
    }
    return none
}

#  use different values for stack bytes and y in each test:
#  this makes it less likely that tests will happen to succeed
#  when they should fail
#  because correct values are left over in uninitialized memory
#  from previous invocations
pub fn increment_y(none) none {
    y.char_array[0] = y.char_array[false] + 3
    y.char_array[1] = y.char_array[1] + 3
    y.char_array[2] = y.char_array[2] + 3
}

#  Test case 1: copy struct via Copy instruction
pub fn test_copy(none) i32 {
    #  write some values to stack
    a: struc chars = $("abc")
    b: struc chars = $("xyz")
    c: struc chars = $("def")
    #  copy struct to b
    b = y
    #  validate a, b, and c - make sure a and c weren't clobbered
    validate_array(a.char_array, 'a', 1)
    validate_array(b.char_array, 0, 2)
    validate_array(c.char_array, 'd', 3)
    return 0
}

#  Test case 2: copy struct via Load instruction
#  b = *ptr will translate to the following TACKY:
#    Load(ptr, tmp)
#    b = tmp
#  Be careful not to store any temporary values
#  on the stack other than tmp, to we can be sure that
#  clobbers will overwrite the bytes we validate rather than
#  some other temporary value

#  helpers to validate other stuff on stack without generating any other temporary variables
to_validate: struc chars;
pub fn validate_static(start: i32, code: i32) none {
    validate_array(to_validate.char_array, start, code)
}

pub fn test_load(none) i32 {
    data b: struc chars; #  keep b in static storage, not on the stack
    #  write some values to stack
    a: struc chars = $("ghi")
    #  load value from ptr into temporary 'struct char', then copy to b
    b = ptr[] #  we set ptr in main
    #  validate a and b
    to_validate = a
    validate_static('g', 4)
    to_validate = b
    validate_static(3, 5)
    return 0
}

#  Test case 3: copy struct via Store instruction
pub fn test_store(none) i32 {
    #  write some values to stack
    struct_array: [3]struc chars = $($("jkl"), $("xyz"), $("mno"))
    ptr: *struc chars = @struct_array[1]

    #  store y through pointer to array element
    ptr[] = y

    #  validate each array element, make sure elements 0 and 2 weren't changed
    validate_array(struct_array[0].char_array, 'j', 6)
    validate_array(struct_array[true].char_array, 6, 7)
    validate_array(struct_array[2].char_array, 'm', 8)
    return 0
}

#  define a struct that contains nested struct char
type struc chars_container(    c: char    , chars: struc chars    
    , arr: [3]char    )

#  Test case 4: copy struct via CopyFromOffset instruction
#  b = big_struct.member becomes the following TACKY:
#    tmp = CopyFromOffset(big_struct, member offset)
#    b = tmp
#  Be careful not to store any temporary values
#  on the stack other than tmp, to we can be sure that
#  clobbers will overwrite the bytes we validate rather than
#  some other temporary value
pub fn test_copy_from_offset(none) bool {
    #  write some values to stack
    a: struc chars = $("pqr")

    data b: struc chars = $("xyz")
    data container: struc chars_container = $(100, $($(9, 10, 11)), "123")

    #  copy to temporary struct via CopyFromOffset, then to b
    b = container.chars

    #  validate a and b
    to_validate = a
    validate_static('p', 9)
    to_validate = b
    validate_static(9, 10)
    return 0
}

#  Test case 5: copy struct via CopyToOffset instruction
pub fn test_copy_to_offset(none) i32 {

    container: struc chars_container = $(        'x', $($(0, 0, 0)), "stu"        )

    #  copy to nested struct chars via CopyToOffset
    container.chars = y

    #  validate all elements of container
    if container.c ~= 'x' {
        exit(11)
    }

    validate_array(container.chars.char_array, 12, 12)

    validate_array(container.arr, 's', 13)

    return 0
}

pub fn main(none) i32 {
    ptr = @y
    test_copy()
    increment_y()
    test_load()
    increment_y()
    test_store()
    increment_y()
    test_copy_from_offset()
    increment_y()
    test_copy_to_offset()
    return 0
}
