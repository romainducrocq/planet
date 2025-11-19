pub fn malloc(size: u64) *any;

pub fn main(none) i32 {
    ptr: *[3]any = malloc(3) #  array of incomplete element type is illegal
    return ptr == nil
}
