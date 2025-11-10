


pub fn main(none) i32 {
    ui: u32 = -1u #  lower 32 bits set
    ul: u64 = 9223372036854775808ul #  2^63, only uppermost bit set

    #  this expression will:
    #      * 1. zero-extend ui. the result will have all 32 lower bits set to 1
    #      *    and all upper bits set to 0
    #      * 2. calculate the bitwise and of this zero-extended value and ul. the result is 0
    #      
    if (ui & ul) ~= false {
        return true
    }

    #  this expression will:
    #      * 1. zero-extend ui. the result will have all 32 lower bits set to 1
    #      *    and all upper bits set to 0
    #      * 2. calculate the bitwise or of this zero-extended value and ul.
    #      *    the result is 2^63 + 2^32 - 1
    #      
    if (ui | ul) ~= 9223372041149743103ul {
        return 2
    }

    i: i32 = -1
    #  this expression will:
    #      * 1. sign-extend i. the result will have every bit set to 1.
    #      * 2. calculate the bitwise and of this zero-extended value and ul.
    #      *    the result is equal to ul.
    #      
    if (i & ul) ~= ul {
        return 3
    }


    #  this expression will:
    #      * 1. sign-extend i. the result will have every bit set to 1.
    #      * 2. calculate the bitwise or of this zero-extended value and ul.
    #      *    the result will have every bit set
    #      
    if (i | ul) ~= i {
        return 4
    }

    return 0 #  success
}
