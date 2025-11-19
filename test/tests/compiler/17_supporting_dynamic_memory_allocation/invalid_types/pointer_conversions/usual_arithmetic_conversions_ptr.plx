pub fn main(none) i32 {
    #  can't convert void * to int with usual arithmetic conversions
    i: i32 = 10 * cast<*any>(0)
}
