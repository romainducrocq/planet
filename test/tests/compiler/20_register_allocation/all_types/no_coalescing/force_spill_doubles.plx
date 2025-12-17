import "../util"

pub glob: i32 = 3
pub glob2: f64 = 4.0

pub fn target(none) i32 {
    #  force spill by creating lots of conflicting pseudos
    #      * validate that we spill the variable should_spill, which is used least
    #      * and has highest degree
    #      * Note: this isn't a good test of spill metric calculation;
    #      * due to optimistic coloring, we could end up spilling just should_spill
    #      * even if we end up choosing other nodes as spill candidates first
    #      
    should_spill: f64 = cast<f64>(glob)
    #  all these registers conflict with should_spill and each other
    one: f64 = 4.0 - glob
    two: f64 = one + one
    three: f64 = cast<f64>(glob)
    four: f64 = two * two
    five: f64 = glob2 + 1
    six: f64 = glob * 2
    seven: f64 = one * one + 6.0
    eight: f64 = two * 4
    nine: f64 = three * three
    ten: f64 = four + six
    eleven: f64 = 16 - five
    twelve: f64 = six + six
    thirteen: f64 = five + eight
    fourteen: f64 = 21 - seven

    #  validate them
    check_14_doubles(one, two, three, four, five, six, seven, eight, nine, ten,         eleven, twelve, thirteen, fourteen, 1.0)

    #  make another fourteen pseudos that conflict w/ should_spill and each
    #  other
    fifteen: f64 = glob2 * 4.0 - 1
    sixteen: f64 = glob2 * 4.0
    seventeen: f64 = fifteen + 2.0
    eighteen: f64 = 35.0 - seventeen
    nineteen: f64 = sixteen + glob
    twenty: f64 = glob2 * 5.0
    twenty_one: f64 = glob * 7.0
    twenty_two: f64 = 4.0 + eighteen
    twenty_three: f64 = nineteen + glob + 1
    twenty_four: f64 = glob2 + twenty
    twenty_five: f64 = twenty_one + glob2
    twenty_six: f64 = twenty_five - nineteen + twenty
    twenty_seven: f64 = glob * 9.0
    twenty_eight: f64 = twenty_two + 6
    check_14_doubles(fifteen, sixteen, seventeen, eighteen, nineteen, twenty,         twenty_one, twenty_two, twenty_three, twenty_four,         twenty_five, twenty_six, twenty_seven, twenty_eight, 15.0)

    if should_spill ~= 3.0 {
        return -1
    }

    return 0
}

