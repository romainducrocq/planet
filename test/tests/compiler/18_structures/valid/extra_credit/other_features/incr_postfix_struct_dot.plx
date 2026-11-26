#  Tests the fix for the bug reported in
#  * https://github.com/nlsandler/nqcc2/issues/7
#  

type struc simple(    x: i32    )

type struc issue(    ul: u64    , arr: [2]i32    )

pub fn main(none) i32 {
    #  Test on a simple struct 
    s1: struc simple = $(0)

    #  postfix increment on arrow
    if (cast<*struc simple>(@s1))[].x++ ~= 0 {
        return 1
    }
    if s1.x ~= 1 {
        return 2
    }
    if (cast<*struc simple>(@s1))[].x-- ~= 1 {
        return 3
    }
    if s1.x ~= 0 {
        return 4
    }

    #  postfix increment on dot
    if s1.x++ ~= 0 {
        return 5
    }
    if s1.x ~= 1 {
        return 6
    }
    if s1.x-- ~= 1 {
        return 7
    }
    if s1.x ~= 0 {
        return 8
    }

    #  Test passes the initial issue 
    s2: struc issue = $(3, $(2, 2))

    if s2.ul++ ~= 3 {
        return 9
    }
    if s2.ul ~= 4 {
        return 10
    }

    return 0
}

