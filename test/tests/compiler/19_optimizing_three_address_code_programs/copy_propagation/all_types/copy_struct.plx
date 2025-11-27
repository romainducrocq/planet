#  Test that we can propagate copies of aggregate values 
type struc s(    x: i32    , y: i32    
    )

pub fn callee(a: struc s, b: struc s) i32 {
    if a.x ~= 3 {
        return 1 #  fail
    }
    if a.y ~= 4 {
        return 2 #  fail
    }
    if b.x ~= 3 {
        return 3 #  fail
    }
    if b.y ~= 4 {
        return 4 #  fail
    }
    return 0 #  success
}

pub fn target(none) i32 {
    s1: struc s = $(1, 2)
    s2: struc s = $(3, 4)
    s1 = s2 #  generate s1 = s2

    #  Make sure we pass the same value for both arguments.
    #  We don't need to worry that register coalescing
    #  will interfere with this test,
    #  because s1 and s2, as structures, won't be stored in registers.
    return callee(s1, s2)
}

pub fn main(none) bool {
    return target()
}
