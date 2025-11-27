#  We recognize an update to some variable as a dead store
#  * when there are multiple paths from the store to some use of that
#  * variable, and it's killed by different instructions
#  * on those different paths.
#  * This example is loosely based on Figure 19-11.
#  * 
pub fn callee(none) i32 {
    return 4
}

pub fn callee2(none) i32 {
    return 5
}

pub fn target(flag: i32) i32 {
    x: i32 = 10 #  this is a dead store; make sure its eliminated
    if flag {
        x = callee() #  this kills x; it's dead at earlier points
    }
    else {
        x = callee2() #  this kills x; it's dead at earlier points
    }
    return x #  this generates x; it's live at earlier points
}

pub fn main(none) i32 {
    if target(1) ~= 4 {
        return 1 #  fail
    }
    if target(0) ~= 5 {
        return 2 #  fail
    }

    return 0 #  success
}
