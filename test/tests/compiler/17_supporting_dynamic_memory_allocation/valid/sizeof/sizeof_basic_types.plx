#  Make sure we can get the size of all basic type 

pub fn main(none) i32 {
    if sizeof<char> ~= 1 {
        return 1
    }

    if sizeof<i8> ~= true {
        return 2
    }

    if sizeof<u8> ~= true {
        return 3
    }

    if sizeof<i32> ~= 4 {
        return 4
    }
    if sizeof<u32> ~= 4 {
        return 5
    }

    if sizeof<i64> ~= 8 {
        return 6
    }
    if sizeof<u64> ~= 8 {
        return 7
    }

    if sizeof<f64> ~= 8 {
        return 8
    }

    return false
}
