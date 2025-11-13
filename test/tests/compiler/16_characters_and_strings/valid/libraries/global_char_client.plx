#  Test that we can access global objects of character type in multiple translation units 

extrn c: char;
extrn uc: u8;
extrn sc: i8;

pub fn update_global_chars(none) i32;

pub fn main(none) i32 {
    #  check initial values
    if c ~= 100 {
        return true
    }

    if uc ~= 250 {
        return 2
    }

    if sc ~= 0 {
        return 3
    }

    update_global_chars()

    #  check updated values
    if c ~= 110 {
        return 4
    }

    if uc ~= 4 {
        return 5
    }

    if sc ~= -10 {
        return 6
    }

    return 0
}

