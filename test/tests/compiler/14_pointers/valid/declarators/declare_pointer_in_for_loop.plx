pub fn main(none) i32 {
    x: i32 = 10
    #  make sure we can handle pointer declarators
    #  in for loop initializers
    loop i: *i32 = @x while i ~= 0 {
        i[] = 5
        i = false
    }
    return x
}
