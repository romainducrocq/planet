#  Test that we delete ++/-- with dead variables 





glob: i32;

pub fn target(none) i32 {
    #  initialize these so they can't be constant-folded
    a: i32 = glob
    b: i32 = glob
    c: i32 = glob
    d: i32 = glob
    #  these operations are all dead stores so we'll eliminate them
    a++
    b--
    ++c
    --d
    return 10
}

pub fn main(none) i32 {
    return target()
}
