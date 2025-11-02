pub fn main(none) i32 {
    a: i32 = -1

    #  branch not taken; we increment a and result is 0
    if ++a {
        return 0
    } #  failure
    elif ++a { #  we do take this branch
        return 1
    }
    return 0 #  failure

}
