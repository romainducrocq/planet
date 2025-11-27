#  Test that we can propagate all arithmetic types, including doubles,
#  * long and unsigned integers, and characters.
#  * 









pub fn target(none) i32 {
    #  propagate doubles
    d: f64 = 1500.0
    d2: f64 = d

    sum: i32 = cast<i32>((d + d2)) #  3000

    #  propagate chars
    c: char = 250 #  will be converted to -6
    c2: char = c
    sum = sum + (c2 + c) #  2988

    #  propagate unsigned char
    uc: u8 = -1 #  will be converted to 255
    uc2: u8 = uc
    sum = sum + uc + uc2 #  3498

    #  propagate unsigned long
    ul: u64 = 18446744073709551615ul #  ULONG_MAX
    ul2: u64 = ul + 3ul #  wraps around to 2
    sum = sum + ul2 #  3500

    return sum #  rewrite as "return 3500"
}

pub fn main(none) i32 {
    return target() == 3500
}
