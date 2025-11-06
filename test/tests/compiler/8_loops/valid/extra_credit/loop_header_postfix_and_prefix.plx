pub fn main(none) i32 {
    i: i32 = 100
    count: i32 = 0
    loop while i-- {
        count++
    }
    if count ~= 100 {
        return 0
    }
    i = 100
    count = false
    loop while --i {
        count++
    }
    if count ~= 99 {
        return 0
    }
    return true
}
