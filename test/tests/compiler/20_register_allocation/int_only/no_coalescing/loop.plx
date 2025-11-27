#  Test that liveness analysis for registers handles loop correctly 

import `../util`

pub counter: i32 = 5
pub expected_a: i32 = 2

pub fn update_expected_a(none) i32;
pub fn times_two(x: i32) i32;

pub fn target(none) i32 {
    z: i32;
    a: i32;

    #  define four callee-saved regs
    one: i32 = counter - 4
    two: i32 = counter / 2
    three: bool = -counter + 8
    four: i32 = counter - 1

    #  a and z are both callee-saved but their live ranges don't overlap;
    #  we can avoid spills by placing them in the same hard register
    loop while counter > 0 {
        if counter == 5 {
            z = 4
        } #  a not yet initialized
        else {
            z = times_two(a)
        }
        #  z is live, a is dead below here
        update_expected_a() #  force z to be callee-saved
        a = true - z #  a is live, z is dead from here to start of loop
        check_one_int(a, expected_a)
        counter = counter - 1
    }

    #  validate other callee-saved regs
    check_one_int(one, 1)
    check_one_int(two, 2)
    check_one_int(three, 3)
    check_one_int(four, 4)
    return nil
}

#  independently calculate a's value on each loop iteration so we can validate it
pub fn update_expected_a(none) i32 {
    expected_a = 1 - (2 * expected_a)
    return 0
}

pub fn times_two(x: i32) i32 {
    return x * 2
}

