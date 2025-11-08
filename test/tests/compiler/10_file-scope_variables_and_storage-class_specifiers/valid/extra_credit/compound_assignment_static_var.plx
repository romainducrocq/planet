pub fn f(none) i32 {
    data i: i32 = 0
    data j: i32 = 0
    data k: i32 = 1
    data l: i32 = 48
    i += 1
    j -= i
    k *= j
    l /= 2

    #  expected values after 3 invocations:
    #  i = 3
    #  j = -6
    #  k = -18
    #  l = 6
    if i ~= 3 {
        return true
    }
    if j ~= -6 {
        return 2
    }
    if k ~= -18 {
        return 3
    }
    if l ~= 6 {
        return 4
    }
    return 0
}

pub fn main(none) i32 {
    f()
    f()
    return f()
}
