


pub fn main(none) i32 {
    a: i32 = 0
    {
        if a ~= 0 {
            label return_a
            return a
        }
        a: i32 = 4
        jump return_a
    }
}
