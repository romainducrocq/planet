#  subscript expression requires an integer index, not void

pub fn main(none) i32 {
    arr: [3]char;
    return arr[cast<none>(1)]
}
