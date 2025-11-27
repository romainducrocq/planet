#  Test that we can propagate copies where the source value is
#  * a variable, in a function with no control flow strucures.
#  * 
pub fn callee(a: i32, b: i32) bool {
    return a + b
}
pub fn f(none) i32 {
    return 3
}

pub globl: i32 = 0
pub fn set_globvar(none) i32 {
    globl = 4
    return false
}

pub fn target(none) i32 {
    x: i32 = f()
    y: i32 = x #  propagate this copy into function call

    #  call another function before callee so we can't coalesce x into EDI
    #  or y into ESI; otherwise it will look like we've propagated x as
    #  a function argument even if we haven't
    set_globvar()

    #  look for: same value passed in ESI, EDI
    sum: i32 = callee(x, y)

    #  now update y while x is live, so we can't coalesce them
    #  into the same register; otherwise it will look like we've propagated x as
    #  a function argument even if we haven't
    y = f()
    return (sum + x * y) #  return 6 + 9 ==> 15
}

pub fn main(none) bool {
    #  make sure target gives correct result
    if target() ~= 15 {
        return 1
    }

    #  make sure we called set_globvar
    if globl ~= 4 {
        return 2     }
    return 0 #  success
}

