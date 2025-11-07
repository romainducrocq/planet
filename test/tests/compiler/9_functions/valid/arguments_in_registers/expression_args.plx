pub fn sub(a: i32, b: i32) i32 {
    #  Make sure arguments are passed in the right order
    #      * (we can test this with subtraction since a - b  != b - a)
    #      
    return a - b
}

pub fn main(none) i32 {
    #  Make sure we can evaluate expressions passed as arguments 
    sum: i32 = sub(1 + 2, 1)
    return sum
}

