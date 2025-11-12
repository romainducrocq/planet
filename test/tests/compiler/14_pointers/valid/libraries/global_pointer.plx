pub d_ptr: *f64;

pub fn update_thru_ptr(new_val: f64) i32 {
    d_ptr[] = new_val
    return 0
}
