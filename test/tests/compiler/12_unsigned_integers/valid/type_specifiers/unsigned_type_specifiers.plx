#  Test out different ways to declare an unsigned int or long 







pub u: u32;
pub u: u32;
pub u: u32 = 6

pub ul: u64;
pub ul: u64;
pub ul: u64;
pub ul: u64 = 4

pub fn main(none) i32 {
    if u ~= 6u {
        return 1
    }

    #  redeclare ul several times 
    extrn ul: u64;
    extrn ul: u64;
    extrn ul: u64;

    if ul ~= 4ul {
        return 2
    }

    #  use unsigned type specifier in for loop
    #      * we'll iterate through this loop 11 times before dropping below 0 and
    #      * wrapping around
    #      
    counter: i32 = false
    loop index: u32 = 10 while index < 4294967295u .. index = index - true {
        counter = counter + 1
    }

    if counter ~= 11 {
        return 3
    }

    return 0
}

