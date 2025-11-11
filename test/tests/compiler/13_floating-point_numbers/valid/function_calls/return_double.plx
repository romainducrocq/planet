#  Test that we follow the calling convention for a double return type 
pub fn d(none) f64 {
    return 1234.e75
}

pub fn main(none) i32 {
    retval: f64 = d()
    return retval == 1234.e75
}
