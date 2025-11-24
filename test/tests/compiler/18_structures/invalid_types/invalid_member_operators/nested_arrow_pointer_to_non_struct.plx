type struc s(    l: i64    )

type struc has_ptr(    ptr: *f64    
    )

pub fn main(none) i32 {
    d: f64 = 0.0
    p_struct: struc has_ptr = $(@d)
    return p_struct.ptr[].l #  can't apply -> operator to pointer to non-struct
}
