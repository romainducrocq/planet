pub fn main(none) i32 {
    loop .. while 1 {
        #  make sure our label-validation analysis also traverses loop bodies
        label lbl
        return 1
        label lbl
        return 2
    }
    return 0
}
