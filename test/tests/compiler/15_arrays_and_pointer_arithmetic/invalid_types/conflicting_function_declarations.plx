#  This is adjusted to
#  *   int f(int (*arr)[3])
#  
pub fn f(arr: [2][3]i32) i32;

#  This is adjusted to
#  *   int f(int (*arr)[4])
#  * so it conflicts with the previous declaration
#  
pub fn f(arr: [2][4]i32) i32;
