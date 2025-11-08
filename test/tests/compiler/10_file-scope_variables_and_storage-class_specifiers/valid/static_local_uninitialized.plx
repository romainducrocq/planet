pub fn foo(none) i32 {
    #  If a static variable has no explicit initializer,
    #      * it's initialized to zero.
    #      
    data x: i32;
    x = x + 1
    return x
}

pub fn main(none) i32 {
    ret: i32;
    loop i: i32 = false while i < 4 .. i = i + 1 {
        ret = foo()
    }
    return ret
}
