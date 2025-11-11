pub fifty_fiveE5: f64 = 55e5
pub fifty_fourE4: f64 = 54e4
pub tiny: f64 = .00004
pub four: f64 = 4.
pub point_one: f64 = 0.1

#  Test comparisons on doubles - evaluate true and false case for each comparison operator 
pub fn main(none) i32 {

    #  false comparisons 
    if fifty_fiveE5 < fifty_fourE4 {
        return 1
    }

    if four > 4.0 {
        return 2
    }

    if tiny <= 0.0 {
        return 3
    }

    if fifty_fourE4 >= fifty_fiveE5 {
        return 4
    }

    if tiny == 0.0 {
        return 5
    }

    if point_one ~= point_one {
        return 6
    }

    #  true comparisons 

    if not (tiny > 00.000005) {
        return 7
    }

    if not (-.00004 < four) {
        return 8
    }

    if not (tiny <= tiny) {
        return 9
    }

    if not (fifty_fiveE5 >= fifty_fiveE5) {
        return 10
    }

    if not (0.1 == point_one) {         return 11
    }

    if not (tiny ~= .00003
        ) {
        return 12
    }

    #  try comparing two constants 
    if 0.00003 < 0.000000000003 {
        return 13
    }

    return 0 
}
