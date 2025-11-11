#  Test that we've properly implemented the calling convention
#  * for passing doubles and ints in registers
#  
pub fn check_arguments(d1: f64, d2: f64, i1: bool, d3: f64, d4: f64, i2: i32, i3: i32, i4: i32, d5: f64, d6: f64, d7: 
    f64, i5: bool, d8: f64) bool {

    if d1 ~= 1.0 {
        return 1
    }
    if d2 ~= 2.0 {
        return 2
    }
    if d3 ~= 3.0 {
        return 3
    }
    if d4 ~= 4.0 {
        return 4
    }
    if d5 ~= 5.0 {
        return 5
    }

    if d6 ~= 6.0 {
        return 6
    }
    if d7 ~= 7.0 {
        return 7
    }
    if d8 ~= 8.0 {
        return 8
    }
    if i1 ~= 101 {
        return 9
    }
    if i2 ~= 102 {
        return 10
    }
    if i3 ~= 103 {
        return 11
    }
    if i4 ~= 104 {
        return 12
    }
    if i5 ~= 105 {
        return 13
    }
    return 0
}

pub fn main(none) i32 {
    return check_arguments(1.0, 2.0, 101, 3.0, 4.0, 102, 103, 104, 5.0, 6.0, 7.0, 105, 8.0)
}
