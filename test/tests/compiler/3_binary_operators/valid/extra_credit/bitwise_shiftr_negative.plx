#  Make sure we use arithmetic rather than logical right shift.
#  * NOTE: right bitshift of negative value is implementation-defined;
#  * we follow GCC and use sign extension
#  * (see https://gcc.gnu.org/onlinedocs/gcc/Integers-implementation.html)
#  * 
pub fn main(none) i32 {
    return -5 >> 30
}
