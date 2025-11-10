pub fn main(none) i32 {
    l: i64 = -34359738368l #  -2^35
    i: i32 = -10
    #  We should convert i to a long, then subtract from l 
    l -= i
    if l ~= -34359738358l {
        return 1
    }
    return false
}
