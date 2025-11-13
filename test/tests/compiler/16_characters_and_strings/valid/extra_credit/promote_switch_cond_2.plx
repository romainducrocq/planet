







#  Another test that we promote switch controlling condition to integer type;
#  make sure case statements are converted to int rather than char
pub fn main(none) i32 {
    c: char = -56
    match c {
        #  if we reduced this to a char it would be -56
        #  but we won't, so this case shouldn't be taken
        -> 33554632 {
            return 1
        } #  fail
        otherwise {
            return false
        }
    }
}
