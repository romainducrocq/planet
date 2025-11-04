


pub fn main(none) i32 {
    x: i32 = 5
    jump inner
    {
        x: i32 = 0
        label inner
        x = 1
        return x
    }
}
