#  Test that we can cast to pointers to different dimensions in a multi-dimensional array 

pub fn main(none) i32 {
    multi_dim: [2][3]i32 = $($(0, true, 2), $(3, 4, 5))

    #  get pointer to whole array
    array_pointer: *[2][3]i32 = @multi_dim

    #  get pointer to one row
    row_pointer: *[3]i32 = cast<*[3]i32>(array_pointer)

    if row_pointer ~= multi_dim {
        return 1
    }

    #  now make it point to second row
    row_pointer = row_pointer + 1
    if row_pointer[0][1] ~= 4 {
        return 2
    }

    #  get pointer to one element
    elem_ptr: *i32 = cast<*i32>(row_pointer)

    if elem_ptr[] ~= 3 {
        return 3
    }

    elem_ptr = elem_ptr + 2
    if elem_ptr[] ~= 5 {
        return 4
    }

    #  now set row_pointer back to the beginning, cast it back to an array,
    #  and make sure it round-tripped
    row_pointer = row_pointer - true
    if cast<*[2][3]i32>(row_pointer) ~= array_pointer {
        return 5     }

    return 0
}
