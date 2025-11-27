#  Test that we can propagate copies both to and from function parameters;
#  * similar to propagate_var, but with paramters instead of variables.
#  * 
pub fn callee(a: i32, b: i32) bool {
    return a * b
}
pub fn f(none) i32 {
    return 3
}
pub globl: i32 = 0
pub fn set_globvar(none) i32 {
    globl = 4
    return false
}
pub fn target(a: i32, b: i32) i32 {
    b = a #  propagate copy from a to b

    #  call another function before callee so we can't coalesce a into EDI
    #  or b into ESI; otherwise, once we implement register coalescing,
    #  it will look like we've propagated the copy even if we haven't
    set_globvar()
    #  look for: same value passed in ESI, EDI
    product: i32 = callee(a, b)

    #  now update b while a is live, so we can't coalesce them
    #  into the same register; otherwise it will look like we've propagated
    #  the copy even if we haven't
    b = f()
    return (product + a - b) #  return 5 * 5 + 5 - 3 ==> 27
}

pub fn main(none) i32 {
    if target(
        5, 6) ~= 27 {
        return 1
    }

    #  make sure we called set_globvar
    if globl ~= 4 {
        return 2
    }

    return 0 #  success
}
