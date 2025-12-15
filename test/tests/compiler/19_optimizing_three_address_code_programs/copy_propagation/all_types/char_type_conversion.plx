#  Test that we can propagate copies between char and signed char 








use `stdio`

pub fn print_some_chars(a: char, b: char, c: char, d: char) none {
    putchar(a)
    putchar(b)
    putchar(c)
    putchar(d)
}

pub fn callee(c: char, s: i8) i32 {
    return c == s
}

pub fn target(c: char, s: i8) bool {
    #  first, call another function, with these arguments
    #  in different positions than in target or callee, so we can't
    #  coalesce them with the param-passing registers or each other
    print_some_chars(67, 66, c
        , s)

    s = c #  generate s = c - we can do this because for the purposes of copy
    #  propagation, we consider char and signed char the same type

    #  both arguments to callee should be the same
    return callee(s, c)
}

pub fn main(none) i32 {
    return target(65, 64)
}
