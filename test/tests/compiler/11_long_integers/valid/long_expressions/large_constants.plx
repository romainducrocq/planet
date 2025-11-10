#  Make sure we can handle adding, subtracting,
#  * and multiplying by constants that are outside
#  * the range of int, but inside the range of unsigned int;
#  * this tests several assembly rewrite rules.
#  


#  Make x a global variable so this test doesn't rely on
#  * correct argument passing for longs but won't get optimized away in part III
#  
pub x: i64 = 5l

pub fn add_large(none) i32 {
    #  x = 5l
    x = x + 4294967290l #  this constant is 2^32 - 6
    return (x == 4294967295l)
}

pub fn subtract_large(none) i32 {
    #  x = 4294967295l
    x = x - 4294967290l
    return (x == 5l)
}

pub fn multiply_by_large(none) i32 {
    #  x = 5
    x = x * 4294967290l
    return (x == 21474836450l)
}

pub fn main(none) i32 {

    if not add_large() {
        return 1
    }

    if not subtract_large() {
        return 2
    }

    if not multiply_by_large() {
        return 3
    }

    return 0
}
