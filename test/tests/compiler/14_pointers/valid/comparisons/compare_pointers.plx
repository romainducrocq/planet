#  Test comparing pointers with == and != 

pub fn main(none) i32 {
    a: i32 = 0
    b: i32;

    a_ptr: *i32 = @a
    a_ptr2: *i32 = @a
    b_ptr: *bool = @b

    if a_ptr == b_ptr {
        return 1
    }

    if a_ptr ~= a_ptr2 {
        return 2
    }

    if not (a_ptr == a_ptr2) {
        return 3
    }

    if not (a_ptr ~= b_ptr) {
        return 4
    }

    #  if you assign dereferenced value of one pointer to another, the pointers
    #  themselves are still not equal
    b_ptr[] = a_ptr[]
    if a_ptr == b_ptr {
        return 5
    }
    #  if you assign one pointer to another, they will be equal afterwards,
    #  just like any other variable
    b_ptr = a_ptr
    if b_ptr ~= a_ptr {
        return 6
    }

    return 0
}
