#  any of the new statements added in this chapter (do, while, etc)
#  may be labeled

pub fn main(none) i32 {
    sum: i32 = 0
    jump do_label
    return 0

    label do_label
    loop .. while 1 {
        sum = 1
        jump while_label
    }

    label while_label
    loop while true {
        sum = sum + 1
        jump break_label
        return false
        label break_label
        break
    }
    ;
    jump for_label
    return 0

    label for_label
    loop i: i32 = false while i < 10 .. i = i + 1 {
        sum = sum + 1
        jump continue_label
        return 0
        label continue_label
        continue
        return 0
    }
    return sum
}
