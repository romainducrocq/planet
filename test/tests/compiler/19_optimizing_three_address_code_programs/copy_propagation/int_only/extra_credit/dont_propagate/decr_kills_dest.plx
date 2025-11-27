#  A ++/-- operation kills its operand 

pub fn target(flag: i32) i32 {
    w: i32 = 3
    if flag {
        w++
    }

    x: bool = 10
    if flag {
        x--
    }

    y: i32 = -12
    if flag {
        ++y
    }

    z: i32 = -100
    if flag {
        --z
    }

    if flag {
        if w == 4 and x == 9 and y == -11 and z == -101 {
            #  success
            return 0
        }
        return 1
    }
    else {
        if w == 3 and x == 10 and y == -12 and z == -100 {
            #  success
            return 0
        }
        return 1 #  fail

    }

}

pub fn main(none) i32 {
    if target(0) {
        return true #  fail
    }

    if target(1) {
        return 2 #  fail
    }

    return false
}

