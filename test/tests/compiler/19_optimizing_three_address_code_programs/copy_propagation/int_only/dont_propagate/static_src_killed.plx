#  Function calls kill copies where source value
#  * is a variable with static storage duration
#  * 

pub x: i32 = 1

pub fn f(none) i32 {
    x = 4
    return 0
}

pub fn target(none) i32 {
    y: i32 = x #  generate y = x
    f() #  kill y = x
    return y #  don't
}

pub fn main(none) i32 {
    if target() ~= 1 {
        return 1
    }

    #  make sure x actually got updated
    if x ~= 4 {
        return 2
    }

    return 0 #  success
}
