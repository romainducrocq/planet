#  A simple function that's easy to color without spilling.
#  * The test script validates that we don't spill any pseudoregisters in target.
#  

import "../util"

pub fn target(one: i32, two: i32) i32 {
    #  perform a few calculations that make one, two, three, four, and five
    #  interfere
    three: i32 = one + two
    four: i32 = two * two
    five: i32 = three + two
    return check_5_ints(one, two, three, four, five, 1)
}

