pub fn main(none) i32 {
    #  make sure our usual analysis of break/continue labels also traverses labeled statements
    label a_label
    break
    return 0
}
