#  Test that we add a terminating null byte to the empty string 
pub fn main(none) i32 {
    empty: *char = ""
    return empty[0]
}
