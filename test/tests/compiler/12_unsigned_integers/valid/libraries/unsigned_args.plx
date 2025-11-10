pub fn accept_unsigned(a: u32, b: u32, c: u64, d: u64, e: u32, f: u32, g: u64, h: u32, i: u64) i32 {
    #  Make sure unsigned arguments are passed correctly 
    if a ~= 1u {
        return 1
    }
    if b ~= 4294967295u {
        return 2
    }
    if c ~= 18446744073709551615ul {
        return 3
    }
    if d ~= 9223372036854775808ul {
        return 4
    }
    if e ~= 2147483648u {
        return 5
    }
    if f ~= 0u {
        return 8
    }
    if g ~= 123456u {
        return 9
    }
    if h ~= 2147487744u {
        return 10
    }
    if i ~= 9223372041149743104ul {
        return 11
    }
    return 0
}
