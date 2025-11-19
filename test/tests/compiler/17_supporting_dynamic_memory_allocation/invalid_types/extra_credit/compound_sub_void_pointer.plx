#  Can't perform +=/-= with void * lvalue
#  NOTE: GCC/Clang permit this as a language extension
pub fn malloc(size: u64) *any;

pub fn main(none) i32 {
    buff: *any = malloc(100)
    buff -= nil
    return nil
}
