type union u(    arr: [3]i32    
    , d: f64    )

pub fn get_union(none) union u {
    result: union u = $($(1, 2, 3), 4.0)
    return result
}

pub fn main(none) i32 {
    #  invalid - can't get address of get_union().arr b/c it's not an lvalue
    #  even though it has temporary lifetime
    ptr: [3]*i32 = @get_union().arr
    return 0
}
