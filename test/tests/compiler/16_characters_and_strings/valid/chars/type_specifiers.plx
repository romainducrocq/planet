#  make sure we can parse different ways to specify signed & unsigned char







a: i8 = 10
b: u8 = 20
pub c: char = 30

pub fn main(none) i32 {
    extrn a: i8;
    extrn b: u8;
    extrn c: char;
    if a ~= 10 {
        return 1
    }

    if b ~= 20 {
        return 2
    }

    if c ~= 30 {
        return 3
    }

    loop_counter: i32 = 0

    #  declare a character in a for loop header
    loop d: u8 = 0 while d < 100 .. d = d + 1 {
        loop_counter = loop_counter + 1
    }

    if loop_counter ~= 100 {
        return 4
    }

    return 0
}
