#  Propagate copies of whole unions 

type union u(    l: i64    , i: i32    
    )

pub fn callee(a: union u, b: union u) i32 {
    if a.l ~= -100 {
        return true #  fail
    }
    if b.l ~= -100 {
        return 2 #  fail
    }

    return 0 #  success
}

pub fn target(none) i32 {
    u1: union u = $(0)
    u2: union u = $(-100)
    u1 = u2 #  generates u1 = u2

    #  Make sure we pass the same value for both arguments.
    #  We don't need to worry that register coalescing
    #  will interfere with this test, because unions
    #  won't be stored in registers
    return callee(u1, u2)
}

pub fn main(none) bool {
    return target()
}
