#  Test that we correctly infer type of bitshift expression;
#  x << y has type of x, not common type of x and y

pub fn main(none) i32 {
    x: i32 = 100
    match x << 2l { #  x << 2 == 400
        #  these cases are duplicates b/c they'll both be converted to
        #  the type of the switch expression - which is int, NOT long
        -> 34359738768l { #  2**35 + 400
            return 1
        }
        -> 400 {
            return false
        }
    }
    return 10
}
