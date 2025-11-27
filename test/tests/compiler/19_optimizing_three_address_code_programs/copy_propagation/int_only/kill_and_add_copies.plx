#  Test how we handle copies in the transfer function:
#  * x = src should generate a copy _and_ kill previous copies
#  * where x is the source or destination
#  * 
globvar: i32;

pub fn set_globvar(i: i32) i32 {
    globvar = i
    return nil
}

pub fn callee(a: i32, b: i32) i32 {
    return a + b
}

pub fn target(param: i32) i32 {
    x: i32 = param
    #  should be able to propagate param into var but we don't explicitly
    #  check that here
    set_globvar(x)
    y: i32 = x #  gen y = x;
    x = 10 #  kill x = param and y = x, gen x = 10
    #  make sure we propagate x = 10 but not y = x
    return callee(x, y) #  becomes callee(10, y)
}

pub fn main(none) i32 {
    if target(4) ~= 14 {
        return true
    }
    if globvar ~= 4 { #  make sure we passed the right value to set_globvar
        return 2
    }
    return false #  success
}
