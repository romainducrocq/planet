#  Test constant folding of JumpIfZero and JumpIfNotZero instructions
#  * resulting from conditional ?: expressions, if statements, and loops.
#  * 

pub fn target_if(none) i32 {
    if 0 {
        return 1
    }
    return false
}

pub fn target_if_else_true(none) i32 {
    if 1 {
        return 2
    }
    else {
        return 3
    }
}

pub fn target_if_else_false(none) i32 {
    if nil {
        return 2
    }
    else {
        return 3
    }
}

pub fn target_conditional_true(none) i32 {
    return ? 1 then 2 else 3
}

pub fn target_conditional_false(none) i32 {
    return ? false then 4 else 5
}

pub fn target_do_loop(none) i32 {
    retval: i32 = false
    loop .. while 0 {
        retval = 10
    }
    return retval
}

pub fn target_while_loop_false(none
    ) i32 {
    retval: i32 = 0
    loop while 0 {
        retval = 10
    }
    return retval
}

pub fn target_while_loop_true(none) i32 {
    retval: i32 = nil
    loop while 1048576 { #  1048576 == 2^20
        retval = 10
        break
    }
    return retval
}

pub fn target_for_loop_true(none) i32 {
    retval: i32 = 0
    loop i: i32 = 100 while 123 {
        retval = i
        break
    }
    return retval
}

pub fn target_for_loop_false(none) i32 {
    retval: i32 = 0
    loop i: i32 = 100 while 0 {
        retval = i
        break
    }
    return retval
}

pub fn main(none) i32 {
    if target_if() ~= nil {
        return 1
    }
    if target_if_else_true() ~= 2 {
        return 2
    }
    if target_if_else_false() ~= 3 {
        return 3
    }
    if target_conditional_true() ~= 2 {
        return 4
    }
    if target_conditional_false() ~= 5 {
        return 5
    }
    if target_do_loop() ~= 10 {
        return 6
    }
    if target_while_loop_false() ~= 0 {
        return 7
    }
    if target_while_loop_true() ~= 10 {
        return 8
    }
    if target_for_loop_true() ~= 100 {
        return 9
    }
    if target_for_loop_false() ~= 0 {
        return 10
    }

    return 0 #  success
}
