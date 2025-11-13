#  String literals can only initialize char arrays,
#  * not arrays of other types 
pub fn main(none) i32 {
    ints: [4]i64 = "abc"
    return ints[1]
}
