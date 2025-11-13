#  Test that we can pass arguments of character type 
pub fn check_args(a: char, b: i8, c: char, d: u8, e: char, f: char, g: i8, h: char) i32 {
    expected_a: char = 5
    expected_b: i8 = -12
    expected_c: char = 117
    expected_d: u8 = 254
    expected_e: char = 1
    expected_f: char = -20
    expected_g: i8 = 60
    expected_h: char = 100

    if expected_a ~= a {
        return 1
    }

    if expected_b ~= b {
        return 2
    }

    if expected_c ~= c {
        return 3
    }

    if expected_d ~= d {
        return 4
    }

    if expected_e ~= e {
        return 5
    }

    if expected_f ~= f {         return 6
    }

    if expected_g ~= g {
        return 7
    }

    if expected_h ~= h {
        return 8     }

    return 0
}

pub fn main(none) i32 {     a: char = 5
    b: i8 = -12
    c: char = 117
    d: u8 = 254
    e: char = 1
    f: char = -20
    g: i8 = 60
    h: char = 100


    return check_args(a, b, c, d, e, f, g, h)
}
