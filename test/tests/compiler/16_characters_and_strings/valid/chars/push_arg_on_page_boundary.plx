



#  use an int that's within 8 bytes of a page boundary as a stack argument
#  this makes sure we don't use 8-byte push to push 4-byte values in memory
#  NOTE: this doesn't test what it's supposed to on macOS, only on Linux;
#  on Linux the BSS section is at the end of the executable, followed by unmapped memory
#  on macOS the last section in the executable is __LINKEDIT so if we overrun
#  a page boundary we don't hit unmapped memory

extrn zed: char; #  defined in data_on_page_boundary.s
pub fn foo(a: i32, b: i32, c: i32, d: i32, e: i32, f: i32, g: char) i32 {
    return g + 1
}

pub fn main(none) i32 {
    return foo(false, nil, 
        0, 0, nil, 0, zed)
}
