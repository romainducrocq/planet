pub fn main(none) i32 {
    dim2: [1][2]i32 = $($(1, 2))
    dim: [2]i32 = $(3, 4)
    #  dim2 has array type, so it can't be assigned to
    dim2[0] = dim
    return dim[0]
}
