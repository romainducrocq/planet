pub fn main(none) i32 {
    a: i32 = 0

    #  branch not taken; we decrement a, but result is pre-decrement value
    if a-- {
        return 0
    } #  failure
    elif a-- { #  we do take this one
        return 1
    }
    return 0 #  failure

}
