#  Make sure we track that the set of reaching copies from ENTRY is empty 
pub fn target(a: i32, flag: i32) bool {
    if flag {
        #  if we initialized ENTRY with the set of all copies in target,
        #  we'll think that a = 10 reaches this return statement,
        #  and incorrectly rewrite it as 'return 10'
        return a
    }

    a = 10 #  initialize ENTRY w/ empty set of copies, not including this one
    return a
}

pub fn main(none) i32 {
    return target(4, 1)
}
