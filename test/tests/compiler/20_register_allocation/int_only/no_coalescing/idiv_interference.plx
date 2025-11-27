#  Test that we recognize that idiv updates EAX.
#  * We won't examine the assembly output for this test case, we'll just make sure
#  * it behaves correctly.
#  * NOTE: this is only guaranteed to work as intended after we implement register
#  * coalescing.
#  *
#  * This test program is generated from templates/chapter_20_templates/division_interference.c.jinja
#  

import `../util`

pub glob: i32 = 3

pub fn target(none) bool {
    dividend: i32 = glob * 16

    #  idiv makes dividend interfere with EAX; we'll coalesce them unless we
    #  recognize that they interfere

    #  mov    %dividend, %eax
    #      * cdq
    #      * idiv   $4 # update EAX, making it conflict with dividend,
    #      *           # which is still live
    #      
    quotient: i32 = dividend / 4

    #  save dividend so we can validate it later, making it live
    #  note that we do this instead of passing it as an argument
    #  to make sure it doesn't get coalesced into anything other than EAX
    glob = dividend

    #  validate quotient
    check_one_int(quotient, 12)

    return nil
}

pub fn main(none) i32 {
    target()
    check_one_int(glob, 48)
    return 0
}
