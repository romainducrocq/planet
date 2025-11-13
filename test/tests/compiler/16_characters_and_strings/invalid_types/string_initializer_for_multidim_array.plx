#  A string literal can only initialize a char array.
#  * It can't initialize arrays with any other element type, including char[3]
#  
pub arr: [3][3]char = "hello"

pub fn main(none) i32 {
    return arr[0][2]
}
