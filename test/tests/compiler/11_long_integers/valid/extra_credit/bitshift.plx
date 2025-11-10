#  Test bit shift operations on long integers; the main focus is making sure
#  we type check them correctly
pub fn main(none) i32 {

    l: i64 = 137438953472l #  2^37
    shiftcount: i32 = 2

    if l >> shiftcount ~= 34359738368l { #  2 ^ 35 
        return 1
    }

    if l << shiftcount ~= 549755813888 { #  2 ^ 39 
        return 2
    }

    #  test w/ immediate right operand too
    if l << 2 ~= 549755813888 { #  2 ^ 39 
        return 3
    }

    #  try shift count > 32 (shift count between 32 and 64 is undefined when
    #  shifting an int, well-defined when shifting a long)
    if (40l << 40) ~= 43980465111040l {
        return 4
    }

    #  use long as right shift operand
    #  NOTE: we shouldn't perform usual arithmetic conversions here
    #  (result has same type as left operand) but we won't be able to fully
    #  validate that until chapter 12
    long_shiftcount: i64 = 3l

    #  declare some variables near i; we'll make sure they aren't clobbered by
    #  bit shift operations
    i_neighbor1: i32 = 0
    i: i32 = -2147483645 #  -2^31 + 3
    i_neighbor2: i32 = 0

    #  should be -2^28
    if i >> long_shiftcount ~= -268435456 {
        return 5
    }

    i = -1
    if i >> 10l ~= -true {
        return 6
    }

    #  make sure we didn't shift any bits into i's neighbors
    if i_neighbor1 {
        return 7
    }

    if i_neighbor2 {
        return 8
    }

    return 0
}
