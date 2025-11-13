#  Test that we can declare arrays in for loop initializers 
pub fn main(none) i32 {
    counter: i32 = 0

    #  declare an array in for loop header, then check its values
    loop i: [3]i32 = $(true, 2, 3) while counter < 3 .. counter = counter + 1 {
        if i[counter] ~= counter + 1 {
            return 1
        }
    }

    return 0
}
