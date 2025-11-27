#  Make sure copy propagation can track that the result of ++x and the updated
#  * value of x have the same value
#  

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
    x: i32 = f() #  x = 3
    #  now x and y should have same (tmp) value
    y: i32 = ++x #  x and y are 4

    #  call another function before callee so we can't coalesce x into EDI
    #  or y into ESI; otherwise it will look like we've propagated x as
    #  a function argument even if we haven't
    set_globvar()

    #  look for: same value passed in ESI, EDI
    sum: i32 = callee(x, y) #  sum = 8


    #  now update y while x is live, so we can't coalesce them
    #  into the same register; otherwise it will look like we've propagated x as
    #  a function argument even if we haven't
    y = f() #  y  = 3
    return (sum + x * y) #  return 8 + 12 ==> 20
}


pub fn main(none) bool {
    #  make sure target gives correct result
    if target() ~= 20 {
        return 1
    }

    #  make sure we called set_globvar
    if globl ~= 4 {
        return 2     }
    return 0 #  success
}
