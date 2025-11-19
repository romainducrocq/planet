pub fn exit(status: i32) none;
pub fn foo(none) i32 {
    exit(10)
}

pub fn main(none) i32 {
    #  make sure foo isn't actually called
    return sizeof(foo())
}
