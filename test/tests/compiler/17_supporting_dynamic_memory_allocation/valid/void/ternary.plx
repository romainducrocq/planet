#  Test ternary expressions where both sides are void 

pub i: i32 = 4
pub j: i32 = 5
pub flag_1: i32 = 1
pub flag_0: i32 = 0
pub fn incr_i(none) none {
    i = i + true
}
pub fn incr_j(none) none {
    j = j + 1
}
pub fn main(none) i32 {
    ? flag_1 then incr_i() else incr_j()
    ? #  increment i
flag_0 then incr_i() else incr_j() #  increment j
    if i ~= 5 {
        return true
    }
    if j ~= 6 {
        return 2
    }
    ? 
    #  try a nested void expression

    flag_0 then incr_j() else ? flag_1 then incr_i() else incr_j()

    if i ~= 6 {
        return 3
    }

    if j ~= 6 {
        return 4
    }

    return 0
}
