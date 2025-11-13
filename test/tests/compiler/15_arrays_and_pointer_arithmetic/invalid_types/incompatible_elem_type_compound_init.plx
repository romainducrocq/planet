pub fn main(none) i32 {
    #  invalid implicit conversion of double 1.0 to type int *
    arr: [3]*i32 = $(0, false, 1.0)
}
