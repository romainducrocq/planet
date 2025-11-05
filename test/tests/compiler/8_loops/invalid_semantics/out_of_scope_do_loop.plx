#  Test case from Listing 8-3:
#  * A variable declared in a loop body is out of scope in the controlling expression
#  

pub fn main(none) i32 {
    loop .. while a < 100 {
        a: i32 = a + 1
    }
}
