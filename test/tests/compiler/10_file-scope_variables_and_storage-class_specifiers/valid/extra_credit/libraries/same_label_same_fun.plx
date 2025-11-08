fn f(none) i32 {
    jump x
    return 0
    label x
    return 2
}

pub fn f_caller(none) i32 {
    return f()
}
