pub fn main(none) i32 {
    a: i32 = 0
    if a {
        b: i32 = 2
        return b
    }
    else {
        c: i32 = 3
        if a < c {
            return not a
        }
        else {
            return 5
        }
    }
    return a
}
