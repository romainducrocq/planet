#  no pointer arithmetic with pointers to incomplete type
#  (GCC/Clang allow this as an extension)

pub fn main(none) i32 {
    y: i32;
    x: *any = @y
    null: *any = 0
    return x - null
}
