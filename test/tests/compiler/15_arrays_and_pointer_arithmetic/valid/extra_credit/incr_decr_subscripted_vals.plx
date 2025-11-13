#  Apply ++ and -- to subscript expressions, which are lvalues

#  indices (static to prevent copy prop)
pub i: i32 = 2
pub j: i32 = 1
pub k: i32 = 0

pub fn main(none) i32 {
    arr: [3][2][2]bool = $(        $($(1, 2), $(3, 4)), $($(5, 6), $(7, 8)), $($(9, 10)
        , $(11, 
        12)))

    if arr[i][j][k]++ ~= 11 {
        return 1 #  fail
    }
    if arr[i][j][k] ~= 12 {
        return 2 #  fail
    }

    #  also apply ++/-- to indices
    if ++arr[--i][j--][++k] ~= 9 { #  arr[1][1][1] 
        return 3 #  fail
    }

    #  check side effect of updating j
    if arr[i][j][k] ~= 6 { #  arr[1][0][1]
        return 4 #  fail
    }
    if --arr[i][j][k] ~= 5 {
        return 5 #  fail
    }
    return 0 #  success
}
