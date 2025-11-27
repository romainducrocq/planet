#  Propagate ++/-- with unsigned integers (make sure they wrap around correctly) 

pub fn target(none) i32 {
    u: u32 = 0
    u2: u32 = --u
    u3: u32 = u--

    u4: u32 = 4294967295u
    u5: u32 = u4++
    u6: u32 = ++u4

    if not (u == 4294967294u and u2 == 4294967295u and u3 == 4294967295u) {
        return 1 #  fail
    }

    if not (u4 == 1 and u5 == 4294967295u and u6 == 1) {
        return 2 #  fail
    }

    return 0 #  success
}

pub fn main(none) i32 {
    return target()

}
