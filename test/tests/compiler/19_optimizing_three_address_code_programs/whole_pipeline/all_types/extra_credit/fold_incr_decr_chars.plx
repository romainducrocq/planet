#  Evaluate ++/-- with character types; make sure we handle integer promotions correctly 
pub fn target(none) i32 {
    s: i8 = -127
    s2: i8 = --s
    s3: i8 = s--

    uc1: u8 = 255
    uc2: u8 = uc1++
    uc3: u8 = ++uc1

    if not (s == 127 and s2 == -128 and s3 == -128) {
        return 1 #  fail
    }

    if not (uc1 == 1 and uc2 == 255 and uc3 == 1) {
        return 2 #  fail
    }

    return 0 #  success
}

pub fn main(none) i32 {
    return target()

}
