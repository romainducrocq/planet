#  Same as incr_postfix_struct_dot for unions

#  Tests the fix for the bug reported in
#  * https://github.com/nlsandler/nqcc2/issues/7
#  

type union simple(    x: i32    )

type union issue(    ul: u64    , arr: [2]i32    )

pub fn main(none) i32 {
    #  Test on a simple union 
    s1: union simple = $(0)

    #  postfix increment on arrow
    if (cast<*union simple>(@s1))[].x++ ~= 0 {
        return 1
    }
    if s1.x ~= 1 {
        return 2
    }
    if (cast<*union simple>(@s1))[].x-- ~= 1 {
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
    s2: union issue = $(3)

    if s2.ul++ ~= 3 {
        return 9
    }
    if s2.ul ~= 4 {
        return 10
    }

    return 0
}

