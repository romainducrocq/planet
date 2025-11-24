type struc s(    l: i64    )

pub fn main(none) i32 {
    d: f64 = 0.0
    ptr: *f64 = @d
    return ptr[].l #  can't apply -> operator to pointer to non-struct
}
