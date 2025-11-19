extrn ptr: *[3][4]any; #  array of incomplete element type is illegal (including nested array)

pub fn foo(none) *any {
    return ptr
}
