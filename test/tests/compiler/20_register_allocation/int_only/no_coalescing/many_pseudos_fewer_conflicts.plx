#  Test that we can allocate every pseudo without spilling
#  * if there are more pseudoregisters than hard registers but they don't all
#  * conflict
#  

import `../util`

#  define a function that returns a value
#  so we can't just constant fold everything away
pub fn return_five(none) i32 {
    return 5
}

pub fn target(one: i32, two: i32, three: i32) i32 {
    #  define and use some variables
    sum: i32 = one + three
    product: i32 = sum * three
    diff: i32 = product - (three + two)
    check_one_int(sum, 4)
    check_one_int(product, 12)
    check_one_int(diff, 7)

    #  define and use more variables in two branches;
    #  shouldn't interfere with earlier variables,
    #  and variables from one branch shouldn't interfere
    #  with variables in the other
    loop i: i32 = 0 while i < 2 .. i = i + 1 {
        if i % 2 {
            five: i32 = return_five()
            quotient: i32 = 25 / five #  5
            remainder: i32 = 27 % five #  2
            complex: i32 = (quotient + 3) * (remainder + 4) #  48
            check_one_int(quotient, 5)
            check_one_int(remainder, 2)
            check_one_int(complex, 48)
        }
        else {
            hundred: i32 = return_five() * 20
            ninety: i32 = hundred - 10
            seventy: i32 = ? i % 2 then 0 else hundred / 2 + 20
            negative_one_forty_five: i32 = (-ninety / 2) - hundred
            check_one_int(hundred, 100)
            check_one_int(ninety, 90)
            check_one_int(seventy, 70)
            check_one_int(negative_one_forty_five, -145)
        }
    }

    #  one more block of variables
    negative_six: i32 = ~return_five()
    negative_five: i32 = -11 - negative_six
    negative_four: i32 = return_five() - 9
    negative_three: i32 = negative_six / 2
    negative_two: i32 = negative_six / 3

    #  validate these five variables all at once
    check_5_ints(negative_six, negative_five, negative_four, negative_three,         negative_two, -6)

    return 0 #  success
}
