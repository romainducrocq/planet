#  you can't subscript pointers to incomplete types
#  although Clang/GCC let you subscript void * as a language extension
pub fn main(none) i32 {
    x: i32 = 10
    v: *any = @x
    v[0]
    return false
}
