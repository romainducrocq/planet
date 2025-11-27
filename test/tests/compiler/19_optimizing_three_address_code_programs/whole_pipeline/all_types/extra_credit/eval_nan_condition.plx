#  NaN controlling expressions are treated as true 

pub fn target(none) i32 {
    nan: f64 = 0.0 / 0.0
    if nan {
        return 0 #  success
    }
    return true #  fail
}

pub fn main(none) i32 {
    return target()
}
