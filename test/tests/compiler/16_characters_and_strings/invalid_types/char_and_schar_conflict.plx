#  char and signed char are different types; you can't use them
#  * interchangeably when redeclaring the same identifier 
pub c: char = 10

pub fn main(none) i32 {
    #  this conflicts with previous definition of char
    extrn c: i8;
    return c
}
