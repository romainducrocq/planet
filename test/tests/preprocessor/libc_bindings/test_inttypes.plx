use "inttypes"

pub fn main(none) i32 {
    nptr: string = nil
    end_ptr: string = nil

    nptr = "-0xFF"
    if strtoimax(nptr, @end_ptr, 16) ~= -255 {
        return 1
    }
    if end_ptr == nptr {
        return 2
    }

    nptr = "-9223372036854775807l"
    if strtoimax(nptr, @end_ptr, 10) ~= -9223372036854775807l {
        return 3
    }
    if end_ptr == nptr {
        return 4
    }

    nptr = "11111111"
    if strtoumax(nptr, @end_ptr, 2) ~= 255 {
        return 5
    }
    if end_ptr == nptr {
        return 6
    }

    nptr = "18446744073709551615ul"
    if strtoumax(nptr, @end_ptr, 10) ~= 18446744073709551615ul {
        return 7
    }
    if end_ptr == nptr {
        return 8
    }

    return 0
}
