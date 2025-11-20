pub fn foo(none) none {
    return none
}

pub fn main(none) i32 {
    a: i32 = 3
    flag: i32 = 4
    #  you can't have a ternary expression with only one void branch
    #  although Clang/GCC both allow it
    ? flag then foo() else (a = 3)
    return 0
}
