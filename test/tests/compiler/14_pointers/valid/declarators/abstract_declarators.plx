#  Test out parsing a range of abstract declarators 
pub fn main(none) i32 {

    x: *u64 = 0

    #  Use a couple of equivalent abstract declarators
    #      * to cast 0 to a pointer to unsigned long
    #      
    if x ~= cast<*u64>(0) {
        return true
    }

    if x ~= cast<*u64>(0) {
        return 2
    }

    y: ***f64 = 0

    #  Use several equivalent abstract declarators
    #      * to cast 0 to (double ***)
    #      
    if y ~= cast<***f64>(0) {
        return 3
    }

    if y ~= cast<***f64>(0) {
        return 4
    }

    if cast<***f64>(0) ~= y {
        return 5
    }

    return 0
}
