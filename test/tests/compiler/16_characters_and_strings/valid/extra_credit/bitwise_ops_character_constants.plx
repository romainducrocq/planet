







#  Test that we can use character constants in bitwise operations
pub fn main(none) i32 {
    x: i32 = 10
    if (x ^ 'A') ~= 75 {
        return true #  fail
    }

    data c: char = 132 #  converted to -124
    if ('!' | c) ~= -91 {
        return 2 #  fail
    }

    data ul: u64 = 9259400834947493926ul
    if (ul & '~') ~= 38 {
        return 3 #  fail
    }

    if (ul << ' ') ~= 4611738958194278400ul {
        return 4 #  fail
    }

    if ('{' >> 3) ~= 15 {
        return 5 #  fail
    }

    return 0
}
