# You can't declare a function with an initializer.
# Our implementation will reject this during parsing.
# Because the C grammar permits this declaration,
# some compilers may reject it during type checking.
#
pub fn foo(none) i32 = 3

pub fn main(none) i32 {
    return 0
}
