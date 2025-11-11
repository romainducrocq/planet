#  Test linking against a double defined in another file 
extrn d: f64;

pub fn main(none) i32 {
    return d == 1e20
}
