#  You can't implicitly convert between pointers to arrays of different types 

pub fn main(none) i32 {
    four_element_array: [4]i32 = $(1, 2, 3, 4)
    #  &four_element_array has type int (*)[4],
    #  so we can't assign it to a variable with type int (*)[3]
    arr: *[3]i32 = @four_element_array
}
