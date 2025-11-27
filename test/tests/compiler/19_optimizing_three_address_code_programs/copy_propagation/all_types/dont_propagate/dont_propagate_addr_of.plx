#  Test that we don't propagate copies into AddrOf instructions 
pub fn main(none) i32 {
    x: i64 = 1
    y: i64 = 2
    x = y #  gen x = y
    return @x == @y #  don't rewrite as &y == &y
}
