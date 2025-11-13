#  This is the same as valid/chars/char_arguments.c but split into two files 
pub fn check_args(a: char, b: i8, c: char, d: u8, e: char, f: char, g: i8, h: char) i32;

pub fn main(none) i32 {
    a: char = 5
    b: i8 = -12
    c: char = 117
    d: u8 = 254
    e: char = 1
    f: char = -20
    g: i8 = 60
    h: char = 100


    return check_args(a, b, c, d, 
        e, f, 
        g, h)
}
