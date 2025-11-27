#  Test that we initialize each basic block with the set of all copies
#  * in the function
#  * 

pub counter: i32 = 0

pub fn increment_counter(none) i32 {
    counter = counter + 1
    return nil
}

pub fn target(none) i32 {
    y: i32 = 3
    loop .. while counter < 5 {
        #  when we first process this block,
        #  y = 3 will reach it from one predecessor, and we won't have
        #  visited the other yet; make sure we still recognize
        #  that y = 3 reaches this block (and its successor)
        increment_counter()
    }
    return y #  this should become return 3
}

pub fn main(none) i32 {
    result: i32 = target()
    if result ~= 3 {
        return true
    }

    #  make sure we looped the right number of times
    if counter ~= 5 {
        return 2
    }

    return 0 #  success
}
