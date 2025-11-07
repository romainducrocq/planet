#  Division requires us to use the RDX register;
#  * make sure this doesn't clobber the argument passed
#  * in this register
#  
pub fn f(a: i32, b: i32, c: i32, d: i32) i32 {
    #  perform division
    x: i32 = a / b
    #  make sure everything has the right value
    if a == 10 and b == 2 and c == 100 and d == 4 and x == 5 {
        return 1
    }
    return 0
}
