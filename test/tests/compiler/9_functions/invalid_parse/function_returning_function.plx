# You cannot declare a function that returns a function.
# Our implementation will reject this during parsing.
# Because the C grammar permits this declaration,
# some compilers may reject it during type checking.
# 
pub fn foo(none) (i32);

pub fn main(none) i32 {
    return 0
}
