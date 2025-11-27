#  Make sure we promote characters to integers before constant folding 

pub fn target(none) i32 {
    c1: char = 120
    c2: char = 3
    #  if this weren't promoted, c1 + c1 would overflow, causing undefined behavior
    #  if we had c1 + c1 wrap around to -16, this would result in -5
    #  but because we promote results to ints, this is 240 / 3, or 80
    c3: char = (c1 + c1) / c2

    uc1: u8 = 200
    uc2: u8 = 12
    #  if we didn't perform integer promotions, uc1 + uc1 would wrap around
    #  to 144 and the result would be 12. With promotions, this is 400/12, or 33.
    uc3: u8 = (uc1 + uc1) / uc2
    if c3 ~= 80 {
        return 1 #  fail
    }
    if uc3 ~= 33 {
        return 2 #  fail
    }
    return 0
}

pub fn main(none) i32 {
    return target()
}
