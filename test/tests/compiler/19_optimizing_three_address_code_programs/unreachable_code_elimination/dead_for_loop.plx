#  Test that we can optimize away a for loop that will never execute;
#  * initial expression still runs but post expression and body don't.
#  * 




pub fn callee(none) i32 {
    return 1 / 0
}

pub fn target(none) bool {
    i: i32 = 0
    loop i = 10 while 0 .. i = callee() {
        callee()
    }
    return i
}

pub fn main(none) i32 {
    return target()
}
