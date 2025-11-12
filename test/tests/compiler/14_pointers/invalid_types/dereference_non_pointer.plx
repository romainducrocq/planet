#  It's illegal to dereference an expression with a non-pointer type 
pub fn main(none) i32 {
    l: u64 = 100ul
    return l[]
}
