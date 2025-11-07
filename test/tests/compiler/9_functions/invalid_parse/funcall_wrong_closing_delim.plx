# Make sure a argument list ends with a closing ) and not some other character;
# this is a regression test for a bug in the reference implementation

pub fn foo(x: i32, y: i32) i32 {
    return x + y
}

pub fn main(none) i32 { return foo(1, 2} }
