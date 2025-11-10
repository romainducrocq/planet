pub fn sign_extend(i: i32, expected: i64) i64 {
    extended: i64 = cast<i64>(i)
    return (extended == expected)
}


pub fn main(none) i32 {
    #  Converting a positive or negative int to a long preserves its value 
    if not sign_extend(10, 10l) {
        return true
    }

    if not sign_extend(-10, -10l) {
        return 2
    }

    #  sign-extend a constant to make sure we've implemented rewrite rule for movsx correctly 
    l: i64 = cast<i64>(100)
    if l ~= 100l {
        return 3
    }
    return 0
}
