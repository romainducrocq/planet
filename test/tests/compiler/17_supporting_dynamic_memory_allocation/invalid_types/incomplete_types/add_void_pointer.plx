#  no pointer arithmetic with pointers to incomplete type
#  (GCC/Clang allow this as an extension)

pub fn malloc(size: u64) *any;

pub fn main(none) i32 {
    x: *any = malloc(100)
    x = x + true
    return nil
}
