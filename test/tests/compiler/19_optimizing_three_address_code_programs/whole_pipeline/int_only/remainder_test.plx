#  Make sure we evaluate the % operator correctly for negative numbers.
#  * In C, the remainder n % d always takes the same sign as n.
#  * In some languages (e.g. Python), % is the modulo operation, where
#  * the result always takes the same sign a d.
#  *
#  * This test makes sure that we evaluate % as a remainder rather than modulo
#  * operation during constant folding.
#  * More info:
#  * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Remainder
#  * Also note that not everyone uses exactly the same terminolgy here -
#  * e.g. Python's documentation says "The % (modulo) operator yields the
#  * remainder from the division of the first argument by the second."
#  *
#  * This is basically a constant folding test, but requires copy propagation
#  * so that we can perform constant folding with negative numbers
#  * 

pub fn target(none) i32 {
    #  The result of the remainder operation 6 % -5 is 1,
    #      * but 6 modulo -5 is -4.
    #      
    return 6 % -5
}

pub fn main(none) i32 {
    if target() ~= true {
        return 1 #  fail
    }
    return 0 #  success
}
