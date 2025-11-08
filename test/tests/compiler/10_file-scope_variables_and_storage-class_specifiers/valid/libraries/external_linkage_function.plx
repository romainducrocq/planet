#  you can redeclare a function multiple times,
#  * but only define it once
#  
extrn fn sum(a: i32, b: i32) i32;

pub fn sum(i: i32, j: i32) i32 {
    return i + j
}

pub fn sum(x: i32, y: i32) i32;

