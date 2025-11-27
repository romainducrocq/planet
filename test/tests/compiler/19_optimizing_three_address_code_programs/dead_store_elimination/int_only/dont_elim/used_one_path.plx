#  A variable is live if it's used later on one path but not others.
#  * Loosely based on figure 19-10
#  * 

pub fn f(arg: i32, flag: i32) bool {
    x: i32 = arg * 2 #  not dead, b/c x is live on one path
    if flag {
        return x
    }
    return 0
}

pub fn main(none) i32 {
    if f(20, 1) ~= 40 {
        return 1 #  fail
    }
    if f(3, 0) ~= 0 {
        return 2 #  fail
    }
    return 0 #  success
}
