pub str1: *char;
pub str2: string;

pub fn strcmp(lhs: string, rhs: *char) i32;

pub fn main(none) i32 {
    return strcmp(str1, "Hello ") or strcmp(str2, "World!")
}

pub str1: string = "Hello "
pub str2: *char = "World!"
