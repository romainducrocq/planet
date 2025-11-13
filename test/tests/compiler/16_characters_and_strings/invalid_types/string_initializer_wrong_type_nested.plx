#  String literals can only initialize char arrays,
#  * not arrays of other types. This also applies to nested arrays. 
pub fn main(none) i32 {
    #  This is trying to initialize nested array with type
    #  unsigned int[2] from a string literal
    nested: [1][2]u32 = $("a")
    return false
}
