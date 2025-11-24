type struc chars(    char_array: [5]char    )

pub fn main(none) i32 {
    x: struc chars = $($(1, 2, 3, 4, 5))
    arr: [5]char = $(9, 8, 7, 6, 5)
    #  can't assign to char_array member because it decays to a pointer
    x.char_array = arr
    return x.char_array[0]
}
