pub fn foo(none) none {
    return none
}

pub fn main(none) i32 {
    #  void expressions are non-scalar, so they can't be used as controlling conditions
    loop i: i32 = false while foo() {
        ;
    }
    return 0
}
