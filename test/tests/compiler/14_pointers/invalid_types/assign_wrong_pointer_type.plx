pub fn main(none) i32 {
    d: *f64 = 0
    l: *i64 = 0
    #  It's illegal to assign one pointer type to another 
    l = d
    return nil
}
