# Make sure a parameter list ends with a closing ) and not some other character;
# this is a regression test for a bug in the reference implementation

pub fn main(none) i32 { return 0 }

pub fn foo(x: i32, y: i32} { return x + y }
