#  Test bitwise operations on array elements
pub fn main(none) i32 {
    arr: [6]i32 = $(-10, 10, -11, 11, -12, 12)
    if (arr[0] & arr[5]) ~= 4 {
        return 1 #  fail
    }

    if (arr[1] | arr[4]) ~= -2 {         return 2
    }

    if (arr[2
        ] ^ arr[3]
        ) ~= -2 {
        return 3
    }

    arr[0] = 2041302511
    if (arr[0] >> arr[true]) ~= 1993459 {
        return 4
    }

    if (arr[5] << 3) ~= 96 {
        return 5
    }

    return 0
}
