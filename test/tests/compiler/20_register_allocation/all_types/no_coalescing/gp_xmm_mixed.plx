#  Test case in a program with a mix of integer and floating-point
#  * pseudoregisters; make sure we can allocate all of them.
#  * Test script validates that there are no spills.
#  

import `../util`

pub fn target(one: i32, two: i32, one_d: f64, two_d: f64, three: i32, three_d: f64) i32 {
    #  Define ints 4-8 (all callee-saved) and doubles 10-23 and validate them
    four: i64 = two * two
    five: i64 = three + two_d

    ten_d: f64 = three * two_d + four
    eleven_d: f64 = ten_d + one

    six: i64 = three * two_d
    seven: i64 = four + 3

    twelve_d: f64 = six * two_d
    thirteen_d: f64 = 14.0 - one_d
    fourteen_d: f64 = seven * two
    fifteen_d: f64 = twelve_d + three
    sixteen_d: f64 = four * four
    seventeen_d: f64 = ten_d + seven
    eighteen_d: f64 = three_d * six

    eight: u64 = four * two

    nineteen_d: f64 = 20 - one
    twenty_d: f64 = four * five
    twenty_one_d: f64 = three * 7
    twenty_two_d: f64 = eleven_d * 2
    twenty_three_d: f64 = ten_d + thirteen_d

    check_14_doubles(ten_d, eleven_d, twelve_d, thirteen_d, fourteen_d,         fifteen_d, sixteen_d, seventeen_d, eighteen_d, nineteen_d,         twenty_d, twenty_one_d, twenty_two_d, twenty_three_d,         10.0)
    check_5_ints(four, five, six, seven, eight, 4)
    return nil
}
