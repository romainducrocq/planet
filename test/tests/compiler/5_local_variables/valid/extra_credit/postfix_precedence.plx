#  Postfix operators have higher precedence than prefix 

pub fn main(none) i32 {
    a: i32 = 1
    b: i32 = not a++
    return (a == 2 and b == 0)
}
