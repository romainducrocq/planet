#  Make sure this pass removes unused label instructions 





pub fn target(none) i32 {
    label lbl
    return 0
}

pub fn main(none) i32 {
    return target()
}
