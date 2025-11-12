extrn d_ptr: *f64;
pub fn update_thru_ptr(new_val: f64) i32;

pub fn main(none) i32 {
    d: f64 = 0.0
    d_ptr = @d
    update_thru_ptr(10.0)
    return (d == 10.0)

}
