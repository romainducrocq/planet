#  Basic test of two forms of sizeof: referring to type names and expressions 

pub fn main(none) i32 {
    if sizeof<i32> ~= 4 {
        return 1
    }

    if sizeof(3.0) ~= 8 {
        return 2
    }

    return 0
}
