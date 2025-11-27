pub fn target(flag: i32) i32 {
    x: i32 = 10
    jump def_x
    if flag {
        label def_x
        x = 20
    }
    return x #  return 20
}

pub fn main(none) i32 {
    return target(0)
}
