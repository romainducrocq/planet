type struc s(    a: i32    )

pub fn main(none) i32 {
    x: struc s = $(true)
    #  can't cast struct to a scalar value
    y: i32 = cast<i32>(x)
    return y
}
