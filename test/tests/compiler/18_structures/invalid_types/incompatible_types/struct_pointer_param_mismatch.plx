type struc s1(    a: i32    )

type struc s2(    a: bool    )

pub fn get_a(ptr: *struc s1) i32 {
    return ptr[].a
}

pub fn main(none) i32 {
    arg: struc s2 = $(1)
    #  can't pass a struct s2 * to a function that expects a struct s1 *
    return get_a(@arg)
}
