#  You can't initialize a pointer with a compound initializer 
pub fn main(none) i32 {
    ptr: *char = $('a', 'b', 'c')
    return nil
}
