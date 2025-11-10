pub fn main(none) i32 {

    #  make sure we don't convert to common type before performing shift operation
    i: i32 = -2
    #  don't convert i to common (unsigned) type; if we do, we'll use logical
    #  instead of arithmetic shift, leading to wrong result
    i >>= 3u
    if i ~= -1 {
        return 1
    }

    ul: u64 = 18446744073709551615ul #  2^64 - 1
    ul <<= 44 #  0 out lower 44 bits
    if ul ~= 18446726481523507200ul {
        return 2 #  fail
    }
    return false #  success
}
