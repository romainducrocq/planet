#  array of incomplete element type is illegal
pub fn foo(bad_array: *[3]any) i32 {
    return bad_array == nil
}

pub fn main(none) i32 {
    return 0
}
