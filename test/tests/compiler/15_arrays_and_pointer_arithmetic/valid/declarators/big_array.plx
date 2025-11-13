#  Test that we can parse an array declarator with a size greater than UINT_MAX
#  * Note that we don't actually allocate space for this array!
#  

extrn x: [4294967297l][100000000]i32;

pub fn main(none) i32 {
    return 0
}
