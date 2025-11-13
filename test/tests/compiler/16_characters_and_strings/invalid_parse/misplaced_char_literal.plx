# A char literal is a constant, it's only permitted where constants are
# and not, for example, where you'd normally expect to find a postfix operator

pub fn main(none) i32 {
    a: i32 = 3
    return a'1'
}
