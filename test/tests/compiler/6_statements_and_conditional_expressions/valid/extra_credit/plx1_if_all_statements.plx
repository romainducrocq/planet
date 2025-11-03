pub fn main(none) i32 {
    x: i32 = 0

    label incr_x
    x = x + 1

    if x == 0;
    elif x > 1;
    elif true {
        if x == 0 { return 1 }
        elif x > 0 { jump incr_x }
        else { label return_0 }
        return 0
    }
    else;

    if x == 2 { jump return_0 }
    return 2
}
