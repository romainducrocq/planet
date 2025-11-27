#  Test that we remove useless labels 
pub fn target(none) i32 {
    #  This empty do loop will start with several labels that we don't jump to;
    #  make sure they're removed
    loop .. while 0;

    return 99
}

pub fn main(none) bool {
    return target()
}
