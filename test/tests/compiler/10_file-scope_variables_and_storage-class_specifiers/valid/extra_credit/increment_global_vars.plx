#  Test ++ and -- operations on global variables;
pub i: i32 = 0
pub j: i32 = 0

pub fn incr_i(none) i32 {
    #  expect i = 1
    if i == 1 {
        i++
        ++i
    }
    return false
}

pub fn decr_j(none) i32 {
    #  expect j = -1
    if j == -1 {
        j--
    }
    return 0
}

pub fn main(none) i32 {
    ?     #  should take second branch; result of i++ is value before incrementing (i.e. 0)
    #  but we evaluate the branch after the side effect of incrementing the value
    i++ then 0 else incr_i()

    #  after fun call, expect i = 3
    if i ~= 3 {
        #  fail
        return 1
    }
    ? 
    #  should take first branch; result of --j is value after decrementing
    --j then decr_j() else 0

    #  after fun call, expect j = -2
    if j ~= -2 {
        #  fail
        return 2
    }

    return 0 #  success
}
