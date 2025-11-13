#  String literals can only initialize char arrays,
#  * not arrays of other types.
#  * This also applies to nested static arrays. 
pub fn main(none) i32 {
    #  This is trying to initialize nested array with type
    #  long[2] from a string literal
    data nested: [1][2]i64 = $("a")
    return false
}
