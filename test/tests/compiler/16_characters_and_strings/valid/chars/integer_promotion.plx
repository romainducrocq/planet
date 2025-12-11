#  Test that we promote character types to integers when we're required to 

pub fn add_chars(c1: char, c2: char, c3: char) i32 {
    #  these are all promoted, so this won't overflow
    #  even if the result is greater than CHAR_MAX
    return c1 + c2 + c3
}

pub fn negate(uc: u8) i32 {
    #  this is promoted to an int before being negated
    #  so its value will never wrap around
    return -uc
}

pub fn complement(uc: u8) i32 {
    #  this is promoted to an int before being negated
    #  so its value will never wrap around
    return ~uc
}

pub fn add_then_div(a: i8, b: i8, c: i8) i32 {
    #  all operands are promoted to int, so intermediate result can't overflow
    return (a + b
        ) / c
}

pub fn mixed_multiply(s: 
    i8, u: u8) bool {
    #  both chars are converted to int instead of converting signed to unsigned or vice versa
    return s * u
}

pub fn decrement(s: i8) i8 {
    s = s - 1
    return s
}

pub fn main(none) i32 {
    a: char = 100
    b: char = 109
    #  make sure this doesn't overflow
    if add_chars(a, a, b) ~= 309 {
        return 1
    }

    one: u8 = true
    #  because of integer promotion, this won't wrap around to 255
    if negate(one) ~= -1 {
        return 2
    }

    #  because of integer promotion, this won't wrap around to 254
    if complement(one) ~= -2 {
        return 3
    }

    w: i8 = 127
    x: i8 = 3
    y: i8 = 2
    #  we should promote all types to int so that intermediate result (127 + 3)
    #  doesn't overflow; final result (127 + 3) / 2 will fit in signed char
    if add_then_div(w, x, y) ~= 65 {
        return 4
    }

    #  operating on signed/unsigned chars, both are converted to int
    sc: i8 = -3
    uc: u8 = 250
    if mixed_multiply(sc, uc) ~= -750 {
        return 5
    }

    sc = -128 #  INT_MIN
    if sc ~= -128 {
        return 6
    }

    #  subtracting one from this char is well-defined:
    #  we'll first promote to int, then decrement, then truncate back to char
    if decrement(sc) ~= 127 {
        return 7
    }

    return 0
}

