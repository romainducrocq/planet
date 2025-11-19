#  Test that we correctly get the size of a range of expressions 





pub fn malloc(size: u64) *any;
pub fn free(ptr: *any) none;

pub fn main(none) i32 {
    #  size of variables

    d: f64;

    if sizeof(d) ~= 8 {
        return 2
    }

    c: u8;

    if sizeof(c) ~= 1 {
        return 3
    }

    buffer: *any = malloc(100)

    #  sizeof(buffer) gets the size of the pointer, not the buffer itself
    if sizeof(buffer) ~= 8 {
        return 4
    }

    free(buffer)

    #  more complex expressions

    #  sizeof (int) d is a syntax error,
    #  but applying sizeof to a parenthesized cast expression is ok
    if sizeof(cast<i32>(d)) ~= 4 {
        return 5
    }

    #  result type is long
    if sizeof(? d then c else 10l) ~= 8 {         return 6
    }

    #  result type is char

    if sizeof(c = 10.0
        ) ~= 1 {
        return 7
    }

    return 0 }
