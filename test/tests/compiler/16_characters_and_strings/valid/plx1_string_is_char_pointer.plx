pub str1: *char;
pub str2: string;

pub fn strcmp(lhs: string, rhs: *char) i32;

pub fn main(none) i32 {
    a: char = 'x'
    a_ptr: string = @a
    if a_ptr[0] ~= 'x' {
        return 1
    }

    return strcmp(str1, "Hello ") or strcmp(str2, "World!")
}

pub str1: string = "Hello "
pub str2: *char = "World!"
