







pub fn switch_on_uint(ui: u32) i32 {
    match ui {
        -> 5u {
            return false
        }
        #  this will be converted to an unsigned int, preserving its value
        -> 4294967286l {
            return true
        }
        #  2^35 + 10, will be converted to 10
        -> 34359738378ul {
            return 2
        }
        otherwise {
            return 3
        }
    }
}

pub fn main(none) i32 {
    if switch_on_uint(5) ~= 0 {
        return 1
    }
    if switch_on_uint(4294967286) ~= 1 {
        return 2
    }
    if switch_on_uint(10) ~= 2 {
        return 3
    }
    return 0
}
