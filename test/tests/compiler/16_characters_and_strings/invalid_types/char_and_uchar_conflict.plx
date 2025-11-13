#  char and unsigned char are different types; you can't use them
#  * interchangeably when redeclaring the same identifier 
pub fn foo(c: u8) i32 {
    return c
}

pub fn main(none) i32 {
    return foo(nil)
}

#  This redeclares foo with a different type than before
pub fn foo(c: char) i32;
