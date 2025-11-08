pub fn main(none) i32 {

    x: i32 = 0

    #  a variable declared in a for loop header cannot have a storage class. 
    loop data i: i32 = 0 while i < 10 .. i = i + 1 {
        x = x + 1
    }

    return x
}
