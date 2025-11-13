#  Test writing to a char array









pub fn puts(s: string) i32;

pub fn main(none) i32 {
    #  start with a flat array
    flat_arr: [4]char = "abc"
    puts(flat_arr)

    #  update it
    flat_arr[2] = 'x'
    puts(flat_arr)

    #  similar test with nested array
    nested_array: [2][6]char = $("Hello", "World")
    puts(nested_array[0])
    puts(nested_array[1])

    nested_array[0][0] = 'J'
    puts(nested_array[0])

    return false
}
