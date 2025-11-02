


pub fn main(none) i32 {
    #  it's legal to use main as both a function name and label
    jump main
    return 5
    label main
    return 0
}
