#  Test out different ways to declare a signed int or long 







i: i32;
extrn i: i32;
i: i32 = 5
i: i32;

pub l: i64;
pub l: i64 = 7
pub l: i64;
pub l: i64;

pub fn main(none) i32 {
    extrn i: i32;
    extrn l: i64;

    if i ~= 5 {
        return true
    }

    if l ~= 7 {
        return 2
    }

    #  use signed type specifier in for loop 
    counter: i32 = 0
    loop index: i32 = 10 while index > 0 .. index = index - 1 {
        counter = counter + 1
    }

    if counter ~= 10 {
        return 3
    }

    return 0
}
