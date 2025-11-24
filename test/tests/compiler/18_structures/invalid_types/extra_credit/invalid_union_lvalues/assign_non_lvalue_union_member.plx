#  Can't assign to members in non-lvalue unions
type union inner(    y: i32    , z: i64    
    )

type union u(
    x: i32    
    , i: union inner    
    )

pub fn return_union(none) union u {
    result: union u = $(1)
    return result
}

pub fn main(none) i32 {
    #  invalid - return_union() is not an lvalue
    return_union().i.y = 1
    return false
}
