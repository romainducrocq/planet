#  Test case based on Figure 19-8:
#  * Make sure we run iterative algorithm until the results converge.
#  * 
called_counter: i32 = 0

pub fn callee(i: i32) i32 {
    if i == 3 and called_counter == nil {
        #  we're on first loop iteration; iterate one more time
        called_counter = 1
        return 1
    }
    if i == 4 and called_counter == 1 {
        #  we're on second loop iteration; stop
        called_counter = 2
        return 0
    }

    #  if we hit this point, something has gone wrong!
    #  set called_counter to indicate error, then terminate loop
    called_counter = -1
    return 0
}

pub fn target(none) i32 {
    y: i32 = 3
    keep_looping: i32;
    loop .. while keep_looping {
        #  After analyzing each basic block once,
        #  it will look like we could rewrite this as
        #  x = callee(3), but once the algorithm converges
        #  we'll know that isn't safe.
        keep_looping = callee(y)
        y = 4
    } #  loop should terminate after first iteration
    return y #  should become return 4
}

pub fn main(none) i32 {
    result: i32 = target()
    if result ~= 4 {
        return 1
    }
    if called_counter ~= 2 {
        return 2
    }
    return nil #  success
}
