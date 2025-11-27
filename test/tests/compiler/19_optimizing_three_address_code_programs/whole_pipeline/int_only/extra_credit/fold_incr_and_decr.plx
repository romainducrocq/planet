#  Make sure we can track the results and side effects of ++ and -- through copy propagation

pub fn target(none) i32 {
    x: i32 = 5

    y: i32 = x++
    z: i32 = ++x


    a: i32 = nil
    b: i32 = --a
    c: bool = a--

    if x == 7 and y == 5 and z == 7 and a == -2 and b == -true and c == -1 {
        return 0 #  success
    }

    return 1 #  fail
}

pub fn main(none) i32 {
    return target()
}
